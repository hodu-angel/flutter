## 박스의 폭
% 비중으로 할당한다.
<br><br>

- Flexible
```
body: Row(
    children: [
        Flexible(child: Container( color: Colors.blue ), flex: 3),
        Flexible(child: Container( color: Colors.green ), flex: 7),
    ],
)
```

<br><br>

- Expanded
flex:1 가진 Flexible박스와 같다.
```
body: Row(
	children: [
		Expanded(child: Container( color: Colors.blue ),),
		Expanded(child: Container( width: 100, color: Colors.green ), flex: 7), 
	],
)
```