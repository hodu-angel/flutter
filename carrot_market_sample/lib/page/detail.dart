import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String>? data;

  DetailContentView({Key? key, this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  Size? size;
  List<Map<String, String>?>? imgList;
  int? _current;
  final CarouselController _controller = CarouselController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _current = 0;
    imgList = [
      {'id' : '1', 'url' :  widget.data!['image'].toString()},
      {'id' : '2', 'url' :  widget.data!['image'].toString()},
      {'id' : '3', 'url' :  widget.data!['image'].toString()},
      {'id' : '4', 'url' :  widget.data!['image'].toString()},
      {'id' : '5', 'url' :  widget.data!['image'].toString()},
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    //transparent 부모의 속성을 따라간다.
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          //현재 히스토리 제거하면서 뒤로감
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.white,
            )),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: widget.data!['cid'].toString(),
            child: CarouselSlider(
              options: CarouselOptions(
                //height는 width만큼 size가 동일해야 된다.
                height: size!.width,
                initialPage: 0,
                //무한 스크롤 방지
                enableInfiniteScroll: false,
                //이미지화면 사용 비율
                viewportFraction: 1,
                onPageChanged: (index, reason){
                  setState(() {
                    _current = index;
                  });
                }
              ),
              //slide를 보여줄 이미지
              items: imgList?.map((map) {
                return Image.asset(
                  map!['url'] as String,
                  width: size!.width,
                  fit: BoxFit.fill,
                );
              }).toList(),
              carouselController: _controller,
            ),
          ),
          Positioned(
            //positioned는 영역을 크기만큼만 갖고있기때문에,부분적으로 위치설정한다
            //left 0 right 0 이면 왼쪽끝부터 오른쪽 끝까지 사용한다는 것. 공간 확대
            bottom: 0,
            left: 0,
            right: 0,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList!.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    //horizontal로 이미지 슬라이드버튼 사이간격을 늘린다.
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                        //선택 됐을 때 색
                            ? Colors.white
                        //미선택일 때 색
                            : Colors.white.withOpacity(0.5))
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      width: size!.width,
      height: 55,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //앱바의 뒤로 확장을 하겠다.
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
