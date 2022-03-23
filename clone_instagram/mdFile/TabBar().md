# _tabMenu()
- child와 preferredSize를 required한다.
- TabBar()의 controller를 사용하기 위해서 with TickerProviderStateMixin 한다.
<br><br>

- search_focus.dart
```
...
class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
   late TabController tabController;
   
   @override
  void initState() {
    super.initState();
    //this를 사용하기 위해서 with TickerProviderStateMixin을 해줘야 된다.
    tabController = TabController(length: 5, vsync: this);
  }
  
  Widget _body(){
      return TabBarView(
        controller: tabController,
        children: const [
            Center( child: Text('인기페이지') ),
            Center( child: Text('계정페이지') ),
            Center( child: Text('오디오페이지') ),
            Center( child: Text('태그페이지') ),
            Center( child: Text('장소페이지') ),
        ],
      );
  }
  
  //임의의 data
  Widget _tabMenuOne(String menu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        menu,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
    
    PreferredSizeWidget _tabMenu() {
    return PreferredSize(
        ...
        child: TabBar(
            controller: tabController,
            //해당 tab 밑줄 color 변경
            indicatorColor: Colors.black,
            tabs: [
              _tabMenuOne('인기'),
              _tabMenuOne('계정'),
              _tabMenuOne('오디오'),
              _tabMenuOne('태그'),
              _tabMenuOne('장소'),
            ],
        ),
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
```