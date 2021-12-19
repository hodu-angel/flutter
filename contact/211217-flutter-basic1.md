analysis_option.yaml 
 
    rules :
        prefer_typing_uninitialized_variable : false
        prefer_const_constructors_in_immutables : false
        prefer_const_constructors : false
        avoid_print : false
 -Lint를 잠시 끄는 용도

---

- 앱의 시작
    
```
    runApp(const MyApp());
```
<br>

- 텍스트 넣기
```
    return MaterialApp(
        home: Text('안녕')
    );
```
<br>

- 아이콘 넣기
```
    return MaterialApp(
        home: Icon(Icons.star)
    );
```
<br>

- 이미지 넣기
    >이미지의 파일명은 assets
    >pubspec.yaml파일 : 앱만들 때 모든 필요한 자료를 정리한 것.
    >위 파일 내의 ***flutter:*** 하위에 ***assets:*** 추가 하위에 ***- assets/*** 추가
```
    return MaterialApp(
        home: Image.asset('assets/coke.jpg')
    );
```
<br>

- 박스 생성
    >박스 생성 단위는 50LP == 1.2cm
    >***home: Center()*** 내 자식의 기준점을 중앙으로 설정한다.
    >***Container()*** 또는 ***SizedBox()***
```
    return MaterialApp(
        home: Center(
            child: Container( width: 50, height: 50, color: Colors.blue),
        )
    );
```