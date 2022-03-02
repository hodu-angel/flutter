import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_instagram/pages/search/search_focus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];

  //각 열마다 사이즈를 누적시킬것임.
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    //gi[1] 은 size가 1이여야 된다. gi[0]과 gi[2]에서 2개씩 묶어 나올 수 있기에.
    for (var i = 0; i < 100; i++) {
      //groupIndex의 값중에서 최소의 값을 가진 index를 순서대로 가져온다.
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      //print(gi);
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
    print('groupBox=>$groupBox');
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              //Navigator처리를 해주면 Get.to를 사용해선 안된다.
              //Get.to(SearchFocus());
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SearchFocus()));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xffefefef)),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(fontSize: 15, color: Color(0xff838383)),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  //3*3으로, 열을 한묶음으로 처리해서 구분한다.
  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
              (index) =>
              Expanded(
                child: Column(
                  children: List.generate(
                    groupBox[index].length,
                        (jndex) =>
                        Container(
                          //device의 가로를 3등분해 1size로 둘 것이다.
                          height: Get.width * 0.33 * groupBox[index][jndex],
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              //색상들을 랜덤하게 보여준다.
                              color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)]),
                          //image를 넣어주면 됨
                          child: CachedNetworkImage(
                            imageUrl: 'https://s3.ap-northeast-2.amazonaws.com/elasticbeanstalk-ap-northeast-2-176213403491/media/magazine_img/magazine_270/%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg',
                            fit: BoxFit.cover,
                          ),
                          //color: Colors.green,
                        ),
                  ).toList(),
                ),
              ),
        ).toList(),
        // children: [
        //   Expanded(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 280,
        //           color: Colors.green,
        //         ),
        //         Container(
        //           height: 140,
        //           color: Colors.orange,
        //         ),
        //       ],
        //     ),
        //   ),
        //   Expanded(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 140,
        //           color: Colors.blue,
        //         ),
        //         Container(
        //           height: 140,
        //           color: Colors.orange,
        //         ),
        //         Container(
        //           height: 140,
        //           color: Colors.green,
        //         ),
        //       ],
        //     ),
        //   ),
        //   Expanded(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 140,
        //           color: Colors.orange,
        //         ),
        //         Container(
        //           height: 140,
        //           color: Colors.green,
        //         ),
        //         Container(
        //           height: 140,
        //           color: Colors.blue,
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //SafeArea를 사용하면 상태표시줄을 벗어나지 않게해준다.
        child: Column(
          children: [
            //Scaffold의 appBar를 사용하지않으면 body가 상단부분까지 영역을 침범한다.
            _appBar(), //슬라이드시 상단이 사라져야되므로 body에서 만든다.
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }
}
