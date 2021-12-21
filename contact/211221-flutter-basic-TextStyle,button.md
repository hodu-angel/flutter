## Text에 style 넣기
1. **Colors.컬러명**
2. **Color(0xffaaaaaa)**
3. **Color.fromRGBO(r, g, b, opacity)**
<br>

```
return MaterialApp(
    home: Scaffold(
        appBar: AppBar(),
        body: Text( '안녕하세요',
            style: TextStyle( color: Colors.blue ),
        ),
    ),
);
```

<br><br>

- **Text size**

``` style: TextStyle( fontSize:30 ) ```
<br>

- **Text 두께**

``` style: TextStyle( fontWeight: FontWeight.w700 ) ```
<br>

-**icon은 color, size가 끝이다.**

<br><br><br>

## 버튼 넣기
>버튼엔 필히 ***child:*** 와 ***onPressed:*** 를 넣어야 잘 보인다.
>클릭시 물결효과가 자동적용 돼 있다.
1. **TextButton()**
2. **IconButton()**
3. **ElevatedButton()**
<br><br>

- IconButton
```
body: SizedBox(
	child: IconButton(
		icon: Icon(Icons.star),
		onPressed: (){},
	),
),
```
<br><br>

 - ElevatedButton
```
body: SizedBox(
	child: ElevatedButton(
		child: Text(‘글자‘),
		onPressed: (){},
		style: ButtonStyle(),
	),
),
```
<br><br><br>

## AppBar()안에 넣을 수 있는 것들

1. **leading**: 왼쪽에 넣을 아이콘
2. **title**: 왼쪽 제목
3. **actions: []** 우측아이콘들