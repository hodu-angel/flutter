## 박스에 여백주기
- margin: 박스의 위치를 얼마만큼 띈다.
- padding: 박스 내의 요소를 얼마만큼 띈다.

    >EdgeInsets.all(숫자), : 모든 면을 균등하게 숫자만큼 띈다.
    >EdgeInsets.fromLTRB(left, top, right, bottom)

<br>

```
return MaterialApp(
	home: Scaffold(
		appBar: AppBar( title: Text(‘앱임’) ),
		body: Container(
			width: 50, height: 50, color: Colors.blue,
			//박스에 여백주기
			margin: EdgeInsets.all(20),
		),
		bottomNavigationBar: BottomAppBar(),
	),
);
```
<br>

- decoration: 나머지 박스 스타일들을 넣는다.

    >BoxDecoration()

```
return MaterialApp(
	home: Scaffold(
		appBar: AppBar( title: Text(‘앱임’) ),
		body: Container(
			width: 50, height: 50,
			decoration: BoxDecoration(
				border: Border.all(color: Colors.black)
			),
		),
		bottomNavigationBar: BottomAppBar(),
	),
);
```
<hr>
<br><br><br>

## Align을 이용한 박스 위치 정렬
Align( alignment: Alignment.bottomCenter )
<br>
```
return MaterialApp(
	home: Scaffold(
		appBar: AppBar( title: Text(‘앱임’) ),
		body: Align(
			//Alignment.bottomCenter 등
			alignment: Alignment.topCenter,
			child: Container(
				width: 50, height: 50,
				decoration: BoxDecoration(
					border: Border.all(color: Colors.black)
				),
			),
		)
		bottomNavigationBar: BottomAppBar(),
	),
);
```
