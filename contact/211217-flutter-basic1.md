- MaterialApp() - 위젯으로써 구글이 제공하는 Material 테마 등을 이용해서 앱을 쉽게 만들 수 있다.<br>
- 아이폰앱 등의 기본 스타일을 만들고 싶다면 Cupertino() 관련 위젯을 사용한다.<br>
- Custom디자인도 MaterialApp()을 사용한다. 디자인도 제공하긴 하지만 유용한 셋팅 등을 제공하기 때문이다.<br>
- MaterialApp()을 빼고 개인적으로 코드를 작성하면 코드량이 3~4배 정도 늘어난다. 

### Scaffold<hr>

- appBar : 상단에 들어갈 위젯
- body : 중단에 들어갈 위젯
- bottomNavigationBar : 하단에 들어갈 위젯

```
return MaterialApp(
 home: Scaffold( //상중하로 나뉘어주는 Scaffold()위젯
  appBar: AppBar(), //상단에 들어갈 위젯
  body: Container(), //중단에 들어갈 위젯
  bottomNavigationBar: BottomAppBar( child: Text('abc') ), //하단에 들어갈 위젯
 )
);
```

### 정렬<hr>

- 권장밑줄을 안뜨게 해주려면 analysis_option.yaml의 rules에 **prefer_const_literals_to_create_immutables : false**를 작성한다.

```
return MaterialApp(
 home: Scaffold( 
  body: Row(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [  //const를 사용하라는 권장밑줄이 뜬다.
    Icon(Icons.star),
    Icon(Icons.star),
   ],
  ),
 )
);
```
<br>

- MainAxisAlignment.center : 가운데 정렬
- MainAxisAlignment.spaceEvenly : 일정 간격을 띄고 정렬
- crossAxisAlignment : CrossAxisAlignment.center 반대축 가운데 정렬

## 자동완성 단축키는 ctrl + space 이다.