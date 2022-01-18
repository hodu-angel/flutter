# BottomNavigationBar
- 선택시 양쪽 아이콘을 밀며 확대되는 애니메이션 효과를 준다.

- 위의 효과를 고정시키고 선택된 버튼(BottomNavigationBarItem)을 Colors.black으로 표시한다.(SvgPicture을 사용하기위해 svg library추가 ***flutter_svg: ^1.0.1*** ver)

```
BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label){
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset('assets/svg/${iconName}_off.svg', width: 22,),
        ),
        //선택된 아이콘 색들어오게 함
        activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset('assets/svg/${iconName}_on.svg', width: 22,),
        ),
        label: label,
    );
  }

Widget _bottomNavigationBarwidget(){
    return BottomNavigationBar(
      //선택시 좌측아이콘을 밀고 확대되는 애니메이션 효과를 확대애니메이션으로 고정시킴
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      //클릭시 글씨사이즈 조절
      selectedFontSize: 12,
      currentIndex: _currentPageIndex,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.black),
      items: [
        _bottomNavigationBarItem('home', '홈'),
        _bottomNavigationBarItem('notes', '동네생활'),
        _bottomNavigationBarItem('location', '내 근처'),
        _bottomNavigationBarItem('chat', '채팅'),
        _bottomNavigationBarItem('user', '나의 당근'),
      ],
    );
}
```
<br>

- _currentPageIndex에 클릭된 index를 저장하여 이를 이용해 body영역에서 switch-case로 해당목록을 불러오게 한다.

```
class _AppState extends State<App> {
  //버전 업으로 인해 나중에 초기화 할것이면 late를 사용해주거나, 처음부터 초기화를 해줘야 된다.
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  Widget _bodyWidget(){
    switch(_currentPageIndex){
      case 0:
        return Home();
        break;
      case 1:
        return Container();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      case 4:
        return Container();
        break;
    }
    return Container();
  }
```

