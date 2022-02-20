# SingleChildScrollView()
- 한줄로 List를 보여주기 위해 사용
<br><br>

```
return SingleChildScrollView(
    //scrollView 방향조정
    scrollDirection: Axis.horizontal,
    child: Row(
        children: List.generate(
        100,    //갯수
        (index) => Container()
        ),
    ),
);
```