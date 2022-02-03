## 스크롤시 appBar color(투명 -> 색) 변환
-  scrollpositionToAlpha에 scroll시 offest(위치)를 저장한다.
-  scrollpositionToAlpha가 255를 넘어가면 다시 (투명 -> 흰색)을 반복하기 때문에 255를 넘어갈시 투명화가 되지 않도록 255로 고정시켜준다.
- scrollpositionToAlpha를 double형으로 주었지만, _appBarWidget에서 Colors.white.withAlpha()가 int값을 받기때문에 scrollpositionToAlpha.toInt()를 해준다.

<br><br>

```
class DetailContentViewState extends State<DetailContentView>{
    ...
    final ScrollController _scrollController = ScrollController();
    double scrollpositionToAlpha = 0;
    
    @override
    void initState(){
        super.initState();
        _scrollController.addListener((){
            //offset: 현재위치
            setState((){
            //offset이 255를 넘어갈때마다 다시 투명해지는 것을 방지
                if(_scrollController.offset>255){
                    scrollpositionToAlpha = 255;
                } else {
                    scrollpositionToAlpha = _scrollController.offest;
                }
            });
        });
    }
    
    ...
    
    PreferredSizeWidget _appbarWidget() {
        return AppBar(
            backgroundColor: Colors.white.withAlpha(scrollpositionToAlpha.toInt()),
            ...
        )
    }
    
    ...
    
    @override
    Widget build(BuildContext context){
        return Scaffold(
            //appbar의 뒤로 확장한다.
            extendBodyBehindAppBar: true,
            ...
        );
    }
}
```