import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_instagram/components/avatar_widget.dart';
import 'package:clone_instagram/components/image_data.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
              type: AvatarType.TYPE3,
              nickname: 'hodu_angel',
              size: 40,
              thumbPath:
                  'https://cdn.pixabay.com/photo/2020/06/02/06/52/cat-5249722__480.jpg'),
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
        imageUrl:
            'https://img.insight.co.kr/static/2021/08/13/700/img_20210813111843_z6yn7ub3.webp');
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
            '좋아요 150개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          //expandable_text library추가하고
          ExpandableText(
            '컨텐츠1입니다.\n컨텐츠1입니다.\n컨텐츠1입니다.\n컨텐츠1입니다.',
            prefixText: 'hodu_angel', //닉네임
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,  //3번째줄 부터 접고 펼 수 있다.
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
          const SizedBox(height: 10),
          _image(),
          const SizedBox(height: 10),
          _infoCount(), //좋아요 영역
          const SizedBox(height: 5),
          _infoDescription(),
          // _replyTextBtn(),
          // _dataAgo(), //며칠 전
        ],
      ),
    );
  }
}
