# 여러가지를 쪼개서 보여줄 GridView.builder
- image를 여러가지 불러오기위해 사용했다.
- childAspectRatio로 정사각형의 사이즈를 만든다.

<br>

```
Widget _imageSelectList(){
    return GridView.builder(
    //scroll을 하지 않는다.
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        
        grideDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,  //가로로 4개씩 보여줌
            mainAxisSpacing: 1, //가로간격 띔
            crossAxisSpacing: 1,    //세로간격 띔
            childAspectRatio: 1,    //정사각형의 size 만들기
        ),
        itemCount: 100, //총 아이템 갯수
        itemBuilder: (BuildContext context, int index){
            return Container(
                color: Colors.orange,
            );
        }
    );
}
```