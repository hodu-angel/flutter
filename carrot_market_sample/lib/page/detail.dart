import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market_sample/components/manor_temperature_widget.dart';
import 'package:carrot_market_sample/utils/data_utils..dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String>? data;

  DetailContentView({Key? key, this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView>
    with SingleTickerProviderStateMixin {
  Size? size;
  List<Map<String, String>?>? imgList;
  int? _current;
  double scrollpositionToAlpha = 0;
  final CarouselController _controller = CarouselController();
  final ScrollController _scrollController = ScrollController();

  //appBar의 버튼들을 스크롤시 다시 색을 바꾸기 위해 사용함
  late AnimationController _animationController;
  late Animation _colorTween;

  @override
  void initState() {
    super.initState();
    //이 클래스에 animator를 달아주겠다는 것.
    _animationController = AnimationController(vsync: this);
    _colorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _scrollController.addListener(() {
      //offset: scroll의 위치
      print(_scrollController.offset);
      setState(() {
        if (_scrollController.offset > 255) {
          scrollpositionToAlpha = 255;
        } else {
          //scroll의 위치를 scrollpositionToAlpha에 저장
          scrollpositionToAlpha = _scrollController.offset;
        }
        _animationController.value = scrollpositionToAlpha / 255;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _current = 0;
    imgList = [
      {'id': '1', 'url': widget.data!['image'].toString()},
      {'id': '2', 'url': widget.data!['image'].toString()},
      {'id': '3', 'url': widget.data!['image'].toString()},
      {'id': '4', 'url': widget.data!['image'].toString()},
      {'id': '5', 'url': widget.data!['image'].toString()},
    ];
  }

  Widget _makeIcon(IconData icon) {
    return AnimatedBuilder(
        animation: _colorTween,
        builder: (context, child) => Icon(icon, color: _colorTween.value));
  }

  PreferredSizeWidget _appbarWidget() {
    //transparent 부모의 속성을 따라간다.
    //widthAlpha 스크롤의 위치에 따라 이동하게 되면 색이 화이트로 변한다.
    //255를 넘어가면 처음투명으로 다시 돌아간다. 이것을 방지하기 위해 offset을 체크해준다.
    return AppBar(
      backgroundColor: Colors.white.withAlpha(scrollpositionToAlpha.toInt()),
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            //현재 히스토리 제거하면서 뒤로감
            Navigator.pop(context);
          },
          icon: _makeIcon(Icons.arrow_back)),
      actions: [
        IconButton(onPressed: () {}, icon: _makeIcon(Icons.share)),
        IconButton(onPressed: () {}, icon: _makeIcon(Icons.more_vert)),
      ],
    );
  }

  Widget _makeSliderImage() {
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
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
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
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
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

  Widget _sellerSimpleInfo() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(50),
          //   child: Container(
          //     width: 50, height: 50, child: Image.asset('assets/images/user.png'),
          //   ),
          // ),
          CircleAvatar(
            radius: 25,
            backgroundImage: Image.asset('assets/images/user.png').image,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '얼른사가세요',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('제주시 도담동'),
            ],
          ),
          //Expanded를 줌으로써 나머지 공간을 차지하게 된다.
          Expanded(child: ManorTemperature(manorTemp: 37.5)),
        ],
      ),
    );
  }

  Widget _line() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 1,
        color: Colors.grey.withOpacity(0.3));
  }

  Widget _contentDetail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            widget.data!['title'] as String,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            '디지털/가전 22시간 전',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 15),
          Text(
            '선물받은 새상품이고\n상품 꺼내보기만 했습니다\n거래는 직거래만 합니다.',
            style: TextStyle(
              fontSize: 15,
              //글씨위아랫줄 간격을 조정
              height: 1.5,
            ),
          ),
          SizedBox(height: 15),
          Text(
            '채팅 3 관심 17 조회 295',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _otherCellContents() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '판매자님의 판매 상품',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '모두보기',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    //스크롤뷰 추가
    //controller 에서 위젯값을 받아온다.
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          _makeSliderImage(),
          _sellerSimpleInfo(),
          _line(),
          _contentDetail(),
          _line(),
          _otherCellContents(),
        ])),

        //padding을 줄 수 있는 sliverWidget
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          //등분하여 이미지를 여러개 보여줄것임.
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //mainAxisSpacing : 아이템 위아래줄 간격
                //crossAxisCount : 아이템 등분 갯수
                //crossAxisSpacing : 아이템 왼오른줄 간격
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            delegate: SliverChildListDelegate(List.generate(20, (index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.grey,
                        height: 120,
                      ),
                    ),
                    Text('상품 제목', style: TextStyle(fontSize: 14)),
                    Text('금액',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            }).toList()),
          ),
        )
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: size!.width,
      height: 55,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print('관심상품 이벤트 발생');
            },
            child: SvgPicture.asset(
              'assets/svg/heart_off.svg',
              width: 20,
              height: 20,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 10),
            width: 1,
            height: 40,
            color: Colors.grey.withOpacity(0.3),
          ),
          Column(
            children: [
              Text(DataUtils.calcStringToWon(widget.data!['price'] as String),
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text(
                '가격제안불가',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xfff08f4f)),
                  child: Text(
                    '채팅으로 거래하기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
