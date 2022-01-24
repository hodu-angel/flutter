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
  List<String>? imgList;
  int? _current;
  final CarouselController _controller = CarouselController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _current = 0;
    imgList = [
      widget.data!['image'].toString(),
      widget.data!['image'].toString(),
      widget.data!['image'].toString(),
      widget.data!['image'].toString(),
      widget.data!['image'].toString(),
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
      child: Column(
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
              items: imgList?.map((url) {
                return Image.asset(
                  url,
                  width: size!.width,
                  fit: BoxFit.fill,
                );
              }).toList(),
              carouselController: _controller,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList!.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
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
