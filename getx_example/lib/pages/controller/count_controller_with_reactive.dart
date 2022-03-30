import 'package:get/get.dart';

enum NUM { FIRST, SECOND }

class User {
  String? name;
  int? age;

  User({this.name, this.age});
}

//extends를 하지않고 하나하나의 stream을 넣는다.
class CountControllerWithReactive extends GetxController {
  //obs는 반응형으로 관리를 해준다는 것이다.
  RxInt count = 0.obs;
  final RxDouble _double = 0.0.obs; //RxDouble은 값을 .value를 사용해서 접근한다.
  RxString value = "".obs;
  Rx<NUM> nums = NUM.FIRST.obs;
  Rx<User> user = User(name: 'hodu', age: 20).obs;
  RxList<String> list = [''].obs;

  //changeNotified나 update를 하지않아도 스스로가 바로 반응형상태관리가 된다.
  void increase() {
    count++;
    _double.value++;
    _double(404);

    nums(NUM.SECOND);

    user(User()); //통째로 넣어서 업데이트를 할 수 있거나
    user.update((_user) {
      //일부만 변경할 수 있다.
      _user!.name = 'hodu_angel';
    });

    //list의 update
    // list.addAll();
    // list.add();
    list.addIf(user.value.name == 'hodu', 'okay'); //item: 추가할 값
  }

  void putNumber(int value) {
    //observer이기 때문에 count에 value를 넣어준다는 의미로 count(value)로 사용한다.
    count(value);
  }

  //ever(count)에서 count는 reactive상태일때만 가능하다.
  @override
  void onInit() {
    //매번 값이 변경될때마다 호출이 된다.
    //ever(count, (_) => print('매번 호출'));
    //한번만 호출
    //once(count, (_) => print('한번만 호출'));
    //서버로부터 데이터를 받아오거나 사용자가 검색을 할 경우에 쓰임.
    //사용자가 입력을 어느정도 마무리했거나 잠시 검색을 멈췄을때 사용자들의 검색을 돕기위해서 사용됨
    //debounce(count, (_)=>print('마지막 변경에 한번만 호출'),time: const Duration(milliseconds: 1));
    interval(count, (_) => print('변경되고 있는 동안에 1초마다 호출'),
        time: const Duration(seconds: 1));
    super.onInit();
  }
}
//reactive는 값의 변화가 생길때만 화면에 update를 날려준다.
