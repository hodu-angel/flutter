# 빈 공간 터치시 키보드 닫힘
- TextField로 입력받을때 빈 영역을 터치하면 키보드가 닫힌다.
```
child: GestureDetector(
    onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
    }
)
```