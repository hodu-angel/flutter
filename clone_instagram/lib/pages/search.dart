import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( //SafeArea를 사용하면 상태표시줄을 벗어나지 않게해준다.
        child: Column(
          children: [
            //Scaffold의 appBar를 사용하지않으면 body가 상단부분까지 영역을 침범한다.
            _appBar(), //슬라이드시 상단이 사라져야되므로 body에서 만든다.
            //_body(),
          ],
        ),
      ),
    );
  }
}
