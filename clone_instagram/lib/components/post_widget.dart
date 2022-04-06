import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_instagram/components/avatar_widget.dart';
import 'package:clone_instagram/components/image_data.dart';
import 'package:clone_instagram/models/post.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
              type: AvatarType.TYPE3,
              nickname: post.userInfo!.nickname,
              size: 40,
              thumbPath: post.userInfo!.thumbnail!),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
        imageUrl: post.thumbnail!);
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(IconsPath.likeOffIcon, width: 65),
              const SizedBox(width: 15),
              ImageData(IconsPath.replyIcon, width: 60),
              const SizedBox(width: 15),
              ImageData(IconsPath.directMessage, width: 55),
            ],
          ),
          ImageData(IconsPath.bookMarkOffIcon, width: 50),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, //컬럼을 꽉차게 하기.
        children: [
          Text(
            '좋아요 ${post.likeCount ?? 0}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          //expandable_text library추가하고
          ExpandableText(
            post.description ?? '',
            prefixText: post.userInfo!.nickname,
            //닉네임
            onPrefixTap: () {
              print('hodu_angel 페이지 이동');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,
            //3번째줄 부터 접고 펼 수 있다.
            //아래 코드로 반드시 더보기 접기를 클릭하지 않아도 ExpandableText영역을 tap하면 접고 펼 수 있다.
            expandOnTextTap: true,
            collapseOnTextTap: true,
            //더보기 접기 color 변경
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '댓글 ${post.replyCount ?? 0}개 모두 보기',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        timeago.format(post.createdAt!),
        style: const TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 10),
          _image(),
          const SizedBox(height: 10),
          _infoCount(), //좋아요 영역
          const SizedBox(height: 5),
          _infoDescription(),
          const SizedBox(height: 5),
          _replyTextBtn(),
          const SizedBox(height: 5),
          _dateAgo(), //며칠 전
        ],
      ),
    );
  }
}
