import 'package:carrot_market_sample/page/detail.dart';
import 'package:carrot_market_sample/repository/contents_repository.dart';
import 'package:carrot_market_sample/utils/data_utils..dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFavoriteContents extends StatefulWidget {
  const MyFavoriteContents({Key? key}) : super(key: key);

  @override
  _MyFavoriteContentsState createState() => _MyFavoriteContentsState();
}

class _MyFavoriteContentsState extends State<MyFavoriteContents> {
  late ContentsRepository contentsRepository;

  @override
  void initState(){
    super.initState();
    contentsRepository = ContentsRepository();
  }
  PreferredSizeWidget _appBarWidgt() {
    return AppBar(
      title: Text(
        '관심목록',
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _bodyWidget() {
    return FutureBuilder(
      future: _loadMyFavoriteContentList(),
      builder: (context, dynamic snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text('데이터 오류'),
          );
        }

        if (snapshot.hasData) {
          return _makeDataList(snapshot.data);
        }

        return Center(
          child: Text('해당 지역에 데이터가 없습니다.'),
        );
      },
    );
  }

  Future<List<dynamic>> _loadMyFavoriteContentList() async{
    return await contentsRepository.loadFavoriteContents();
  }

  _makeDataList(List<dynamic> datas) {
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
                            DataUtils.calcStringToWon(
                                datas[index]['price'].toString()),
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
      itemCount: datas.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidgt(),
      body: _bodyWidget(),
    );
  }
}
