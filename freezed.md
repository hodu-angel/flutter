# Freezed
freezed: [![buildState](https://img.shields.io/pub/v/freezed.svg)](https://pub.dev/packages/freezed) <br>
build_runner: [![buildState](https://img.shields.io/pub/v/build_runner.svg)](https://pub.dev/packages/build_runner) <br>
freezed_annotation: https://pub.dev/packages/freezed_annotation <br>

- 데이터 클래스에서 흔히 필요한 기능들을 한번에 제공해주는 라이브러리이다.
- 비슷한 계열의 json_serializable이 있으며, freezed는 `json_serializable`와 
`copy, toString override, union` 클래스 등을 혼합하여 편의성 기능을 추가로 사용할 수 있게 해준다.
- 변수의 변경사항이 있을 경우, 관련 함수까지 수정하지 않아도 자동으로 제공해준다.
- `Json` 기능을 같이 사용하려면 `fromJson` 메서드만 작성해주면 `toJson`까지 사용가능하다.
- 이외에도 `Assert, Custom method, getter, copy, deep copy` 등을 지원한다.

---
**pubspec.yaml**
```
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: 1.0.2

  freezed: 2.3.2
  freezed_annotation: 2.2.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: 2.0.0

  json_serializable: 6.5.4
  build_runner: 2.3.3
```

**note_data.dart**
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'note_data.g.dart';
part 'note_data.freezed.dart';

@freezed
class Note with _$Note {
 factory Note({
  String? title,
  String? content,
 }) = _Note;

 //fromJson 하나만 작성해도 toJson까지 사용이 가능하다.
 factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
```

build_runner 실행 후 아래와 같은 파일을 얻을 수 있다. <br>
![build_file](https://user-images.githubusercontent.com/90611410/212479725-cc0bab61-e4f5-43be-97c7-0c450d2398c4.PNG)