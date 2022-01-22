import 'package:carrot_market_sample/page/detail.dart';
import 'package:carrot_market_sample/repository/contents_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String currentLocation;
  final _valueList = ['아라동', '오라동', '도남동'];
  String _value = '아라동';
  late ContentsRepository contentsRepository;

  //initState단계에선 Context가 생성되지않는다.
  //didChangeDependencies단계에선 Context가 생성이 된다.
  //Context에 접근하기 위한 로직은 didChange...단계에서 작성해준다.
  @override
  void initState() {
    super.initState();
    currentLocation = '아라동';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    contentsRepository = ContentsRepository();
  }

  //가격에 '원' 붙이기
  final oCcy = NumberFormat('#,###', 'ko_KR');

  String calcStringToWon(String priceString) {
    if (priceString == '무료나눔') return priceString;
    return "${oCcy.format(int.parse(priceString))}원";
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
        child: DropdownButton<String>(
          isDense: true,
          value: _value,
          icon: Icon(Icons.arrow_drop_down),
          underline: Container(),
          //테두리 둥글게
          borderRadius: BorderRadius.all(Radius.circular(10)),
          items: _valueList.map(
            (value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          //null-safety로 인해 null타입 사용
          onChanged: (value) {
            setState(() {
              _value = value!;
              currentLocation = value;
              //print(currentLocation);
              print(_value);
            });
          },
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

  _loadContents() {
    //선택한 동에 해당되는 내용들 보여줌
    return contentsRepository.loadContentsFromLocation(currentLocation);
  }

  _makeDataList(List<Map<String, String>> datas) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      //아이템을 만드는 위젯
      itemBuilder: (BuildContext _content, int index) {
        return GestureDetector(
          //이미지 클릭시 확대되면서 상세페이지 이동
          onTap: () {
            //페이지 전환
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return DetailContentView(
                data: datas[index],
              );
            }));
          },
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  //이미지
                  ClipRRect(
                    //모서리 둥글게
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    //Hero를 이용해 이미지 클릭시 이미지가 점차확대 되면서 페이지전환이 이뤄짐
                    child: Hero(
                      //tag 동일한 이름을 줄 수 없다.
                      tag: datas[index]['cid'].toString(),
                      child: Image.asset(
                        datas[index]["image"].toString(),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                  //metaData
                  //Expanded를 해줌으로서 이미지가 사용하는 영역외에는 모두 사용하게 함
                  Expanded(
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.only(left: 20),
                      //width: MediaQuery.of(context).size.width-100
                      // device 사이즈만큼을 불러옴 -100은 이미지사이즈가 100이기떄문에.
                      // 하지만 연산이 많아질 것임.
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
              )),
        );
      },
      //아이템 사이의 간격을 어떻게 구성할지, 지금은 라인이지만 Custom하도록 도와줌
      separatorBuilder: (BuildContext _content, int index) {
        return Container(height: 1, color: Colors.black.withOpacity(0.1));
      },
      itemCount: 10,
    );
  }

  Widget _bodyWidget() {
    //기다렸다 데이터가 처리될때까지 도와주는 builder
    return FutureBuilder(
      future: _loadContents(),
      builder: (context, dynamic snapshot) {
        //snapshot에 data가 있다.
        //데이터가 있는지 없는지 check 필요
        //연결되기 전이라면 로딩중표시
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text('데이터 오류'),
          );
        }

        //데이터가 있는 경우
        if (snapshot.hasData) {
          return _makeDataList(snapshot.data);
        }

        //나머지
        return Center(
          child: Text('해당 지역에 데이터가 없습니다.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
