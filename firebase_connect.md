# firebase 설정

1. node.js에서 운영체제에 맞는 것 다운 후 설치. <br>
> https://nodejs.org/ko/
<br>

2. cmd에서 'node -v' 입력후 설치되었는지 확인 <br><br>
3. 'npm -v' 입력후 설치되었는지 확인 <br><br>
4. 'npm install -g firebase-tools' 파이어베이스 설치 <br><br>
5. 'firebase --version' 으로 파이어베이스 설치 확인 <br><br>
6. 'firebase login' 으로 파이어베이스 로그인 <br><br>

<hr>

## firebase project 생성
1. cmd 에서 'firebase projects:list'로 해당 계정에 생성되어있는 프로젝트들을 볼 수 있다. <br><br>
2. 'firebase projects:create 프로젝트명' 으로 프로젝트 생성을 한다. <br><br>

## firebase login
1. git에 'firebase login:list' 으로 로그인을 확인한다. <br><br>
2. 로그인이 되어있지 않다면 'firebase login'으로 로그인을 해준다. <br><br>
3. git에 'dart pub global activate flutterfire_cil'를 설치하면 global하게 명령어를 사용할 수 있다. <br><br>
4. 이제 'flutterfire configure' 로 사용하면 된다. <br><br>

- main.dart
```
void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
	
	runApp(const MyApp());
}
```

<br>

- android\app\build.gradle
```
...
defaultConfig{
	...
	multiDexEnabled true
}
```