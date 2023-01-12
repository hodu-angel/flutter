# Json Serializable
[![build Status](https://img.shields.io/pub/v/json_serializable.svg)](https://pub.dev/packages/json_serializable) [![build Status](https://img.shields.io/pub/v/json_annotation.svg)](https://pub.dev/packages/json_annotation) [![issues](https://img.shields.io/github/issues-raw/dart-lang/build/package%3A%20build_runner.svg)](https://github.com/dart-lang/build/labels/package%3A%20build_runner) [![build Status](https://img.shields.io/pub/v/build_runner.svg)](https://pub.dev/packages/build_runner)
- 코드의 직렬화를 위해 사용한다.  

- json_annotation과 json_serializable은 의존관계를 맺고 있기에,  
`import 'package:json_annotation/json_annotation.dart';` 를 필요로 한다.

- build_runner의 동작으로 `@JsonSerializable`로 지정된 class의 json 매핑함수(000FromJson, 000ToJson)을 실행하며 `part '000.g.dart';` 로 지정된 파일이 model 디렉토리에 생성된다.

---
**pubspec.yaml**
```
dependencies:
 flutter:
  sdk: flutter
 cupertino_cions: 1.0.2
 json_annotation: 4.7.0

dev_dependencies:
 flutter_test:
  sdk: flutter
 flutter_lints: 2.0.0
 json_serializale: 6.5.4
 build_runner: 2.3.3
```

**person_data.dart**
```sh
import 'package:json_annotation/json_annotation.dart';
part 'person_data.g.dart';

@JsonSerializable()
class Person{
 final String? name;
 final int? age;

 Person({this.name, this.age});

factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
Map<String, dynamic> toJson() => _$PersonToJson(this);
}
```

`Terminal`에 `flutter pub run build_runner build` 실행 후 IDE 재부팅을 하면 아래와 같은 결과를 얻을 것이다.
![image](https://user-images.githubusercontent.com/90611410/212132819-d642f3d6-dc52-482b-8897-fbc04e155a17.png)

---
### g.dart 파일 생성 시 주의사항
1. `part '000.g.dart'`의 파일명 부분이 해당 파일명과 동일해야 된다. 
2. fromJson() 생성자와 toJson() 메소드 앞에 붙는 이름은 해당 class명과 동일해야 된다.
3. 코드가 저장되지 않은 상태에서 생성되지 않는다.

