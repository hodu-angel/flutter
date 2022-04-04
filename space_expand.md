# 영역 확장 편법
```
Stack(
    children: [
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: GestureDetector(
                onTap: (){
                   //화면 밖을 누르면 닫힌다.
                   FocusManager.instance.primaryFocus?.unfocus();
                }
            ),
        ),
    ],
)
```