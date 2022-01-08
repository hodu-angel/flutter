import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    super.initState();
    datas = [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      },
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        onLongPress: () {
          print('long pressed:');
        },
        child: Row(
          children: [
            Text('아라동'),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ],
        ),
      ),
      //상단바의 아래 그림자효과를 없애고 싶을 때 사용
      //높이라는 뜻
      //1로 주면 실선으로 얇게 나옴
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.tune,
            color: Colors.black,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/bell.svg',
              width: 22,
            )),
      ],
    );
  }

  Widget _bodyWidget() {
    //separated : 아이템마다 사이 간격에 라인이 있는데, 이것을 제공받기 위해 사용
    return ListView.separated(
      //아이템을 만드는 위젯
      itemBuilder: (BuildContext _content, int index) {
        return Container(
            child: Row(
          children: [
            //이미지
            ClipRRect(
              //모서리 둥글게
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                datas[index]["image"].toString(),
                width: 100,
                height: 100,
              ),
            ),
            //metaData
            Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(datas[index]['title'].toString()),
                  Text(datas[index]['location'].toString()),
                  Text(datas[index]['price'].toString()),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/heart_off.svg',
                          width: 13,
                          height: 13,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        //좋아요이미지와 숫자사이의 간격을 위해 SizedBox를 넣음
                        // Text(datas[index]['likes'].toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
      },
      //아이템 사이의 간격을 어떻게 구성할지, 지금은 라인이지만 Custom하도록 도와줌
      separatorBuilder: (BuildContext _content, int index) {
        return Container(height: 1, color: Colors.black.withOpacity(0.5));
      },
      itemCount: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
