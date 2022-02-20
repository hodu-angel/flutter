import 'package:flutter/material.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3 }

class AvatarWidget extends StatelessWidget {
  //story가 있으면 무지개색이 들어가고 없으면 회색으로 봤다는 처리를 함
  bool? hasStory;
  String thumbPath; //썸네일
  String? nickname;
  AvatarType type;
  double? size;

  AvatarWidget({
    Key? key,
    required this.type,
    required this.thumbPath,
    this.hasStory,
    this.nickname,
    this.size,
  }) : super(key: key);

  //type1: 그라데이션 들어감
  Widget type1Widget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purple, Colors.orange]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //type에 따라 다른위젯을 호출하도록 한다.
    switch (type) {
      case AvatarType.TYPE1:
        return type1Widget();
      case AvatarType.TYPE2:
      case AvatarType.TYPE3:
        return Container();
        break;
    }
    return Container();
  }
}