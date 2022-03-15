# Named 라우트
> 동적 url parameters 전달
- main.dart
```
getPages: [
    GetPage(name: '/user/:uid', page: () => const Para()),
],
```
<br>

- home.dart
```
onTap: (){
    Get.toNamed('/user/1004');
}
```
<br>

- para.dart
```
...
Text('${Get.parameters['uid']}'),
```

---

<br>

> 여러 값 전달
- home.dart
```
onTap: (){
    Get.toNamed('/para', arguments: {'name':'hodu', 'age': '20'});
}
```
<br>

- argu.dart
```
Text('${Get.arguments['name']} : ${Get.arguments['age'}'),
```

---

<br>

> class 전달
- home.dart
```
onTap: (){
    Get.toNamed('/cla', arguments: User(name: 'hodu', age: 20));
}

class User{
    String? name;
    int? age;
    User({this.name, this.age});
}
```
<br>


- cla.dart
```
...
Text('${(Get.argumnets as User).name} : ${(Get.arguments as User).age}'),
```