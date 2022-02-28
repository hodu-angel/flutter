import 'package:clone_instagram/components/image_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  _SearchFocusState createState() => _SearchFocusState();
}

//뒤로가기버튼, 검색부분, Tapdrawable 해당페이지 보여주는 탭 슬라이드 구현
class _SearchFocusState extends State<SearchFocus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.backBtnIcon),
          ),
        ),
        //title에도 기본적으로 padding이 있는것 같다.
        //그러므로 titleSpacing으로 간격을 제거해준다.
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef)),
          child: const TextField(
            //none을 하지 않으면 line이 생긴다.
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '검색',
                contentPadding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
                //padding을 주는 만큼 간격이 넓어진다.
                isDense: true),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
