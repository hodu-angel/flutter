import 'package:clone_instagram/components/avatar_widget.dart';
import 'package:clone_instagram/components/image_data.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            100,
            (index) => AvatarWidget(
                type: AvatarType.TYPE1,
                thumbPath:
                    'https://s3.ap-northeast-2.amazonaws.com/elasticbeanstalk-ap-northeast-2-176213403491/media/magazine_img/magazine_301/3-4-%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(IconsPath.logo, width: 270),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          //_postList()
        ],
      ),
    );
  }
}
