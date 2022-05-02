## scroll 시 색상 변경

```
//animationController를 사용하기 위해서 SingleTickerProviderStateMixin를 상속해야 된다.
class _DetailContentViewState extends State<DetailContentView> with SingleTickerProviderStateMixin {
    ...
    //appBar의 버튼들을 스크롤시 (white->black)으로 변경하기 위해 사용함
    late AnimationController _animationController;
    late Animation _colorTween;
    
    @override
    void initState(){
        ...
        //여기 class 안에서 animator를 달아주겠다는 것.
        _animationController = AnimationController(vsync: this);
        _colorTween = ColorTween(begin: Colors.white, end: Colors.black).animate(_animationController);
        
        _scrollController.addListener((){
           setState((){
               ...
               //offset(위치)에 따라 스크롤 색이 변경되어야 되니까.
               _animationController.value = scrollpositionToAlpha / 255;
           });
        });
    }
    
    Widget _makeIcon(IconData icon){
        return AnimatedBuilder(
            animation: _colorTween,
            builder: (context, child) => Icon(icon, color: _colorTween.value));
    }
}
```