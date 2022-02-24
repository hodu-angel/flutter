import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      groupBox[i % 3].add(1); //size를 넣을것임
    }
    print('groupBox=>$groupBox');
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
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
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  //device의 가로를 3등분해 1size로 둘 것이다.
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  color: Colors.green,
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
