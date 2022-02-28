import 'package:clone_instagram/components/image_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  _SearchFocusState createState() => _SearchFocusState();
}

//뒤로가기버튼, 검색부분, Tapdrawable 해당페이지 보여주는 탭 슬라이드 구현
class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    //this를 사용하기 위해서 with TickerProviderStateMixin을 해줘야 된다.
    tabController = TabController(length: 5, vsync: this);
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      child: Container(
        height: 50,
        width: Size.infinite.width, //전체Size
        //TabBar는 controller를 필요로 한다.
        //TabController의 length가 5이므로 5개보다 적거나 많으면 error발생
        child: TabBar(controller: tabController, tabs: const [
          Text(
            '인기',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            '계정',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            '오디오',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            '태그',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            '장소',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ]),
      ),
      //Size.fromHeight(50): 50만큼 떨어지고 밑에 붙는 것이다.
      //AppBar().preferredSize.height: device의 AppBar의 높이만큼 사이즈.
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

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

        //appbar처럼 height가 지정되어있는것을 넣어줘야 된다.
        bottom: _tabMenu(),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
