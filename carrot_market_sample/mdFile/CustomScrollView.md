## 이미지 분할로 보여주기
```
Widget _bodyWidget(){
    return CustomScrollView(
        slivers:    [
          SliverList(
            delegate: SliverChildListDelegate([
                //Scroll될 Widget넣기
                _makeSliderImage(),
                _sellerSimpleInfo(),
                _line(),
                _contentDetail(),
                _line(),
                _otherCellContents(),
            ])),  
            
            //padding을 줄 수있는 sliverWidget
            SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                
                //등분하여 보여줄것
                sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //기본 column정렬로 되어있나보다
                    //crossAxisCount : 아이템 분할기준 갯수
                    //mainAxisSpacing : 아이템 위아랫줄 간격
                    //corssAxisSpacing : 아이템 양옆 간격
                    
                        crossAxisCount:2, mainAxisSpacing: 10,
                        corssAxisSpacing: 10,
                    ),
                    delegate: SliverChildListDelegate(List.generate(20,(index){
                        return Container(...);
                    }).toList()),
                ),
            )
        ],
    );
}
```

<br>

![image](https://user-images.githubusercontent.com/90611410/151529221-1848027a-13a8-461f-a315-80dfa1440495.png)
