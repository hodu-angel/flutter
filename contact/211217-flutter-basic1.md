- 앱의시작

`runApp(const MyApp());`

stless + tab : 앱의 첫번째 화면 단축키
<br>
- 텍스트넣기
```
return MaterialApp{
 home: Text('내용')
};
```
<br> 

-  아이콘넣기

```
return MaterialApp{
 home: Icon(Icons.star)
};
```
<br>

- 이미지넣기
-이미지의 폴더명이 assets일때 이미지명은 coke.jpg라면 경로는 
assets/coke.jpg<br>
-pubspec.yaml파일 : **flutter:** 하위에 **assets:** 추가 **-assets/** 추가<br>
```
return MaterialApp{
 home: Image.asset('경로')
};
```
<br>

- 박스생성
-박스생성 단위는 50LP ==1.2cm
-Center()를 통해 자식의 기준점을 중앙으로 설정한다.
```
return MaterialApp{
 home: Center(
 child: Container( width: 50, height: 50, color: Colors.blue),
)
};
```
