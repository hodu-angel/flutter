import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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

  //가격에 '원' 붙이기
  final oCcy = NumberFormat('#,###', 'ko_KR');
  String calcStringToWon(String priceString){
    return "${oCcy.format(int.parse(priceString))}원";
  }

  Widget _bodyWidget() {
    //separated : 아이템마다 사이 간격에 라인이 있는데, 이것을 제공받기 위해 사용
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      //아이템을 만드는 위젯
      itemBuilder: (BuildContext _content, int index) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
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
                //Expanded를 해줌으로서 이미지가 사용하는 영역외에는 모두 사용하게 함

                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 20),
                    //width: MediaQuery.of(context).size.width
                    //device 사이즈만큼을 불러옴 -100은 이미지사이즈가 100이기떄문에.
                    //하지만 연산이 많아질 것임.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          datas[index]['title'].toString(),
                          //글자가 화면을 넘어가면 ...으로 변경됨. 미사용시 자동 줄바꿈
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          datas[index]['location'].toString(),
                          //withOpacity : 연하게
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          calcStringToWon(datas[index]['price'].toString()),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                Text(datas[index]['likes'].toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
