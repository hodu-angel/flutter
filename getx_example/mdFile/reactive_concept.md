# Reactive_state_manage_concept
- 같은 값을 갖을 경우에 중복되는 source를 재호출하지 않으므로 resource를 아낄 수 있다는 장점을 가진다. <br>
- GetxController를 extends하지 않아도 된다. <br>
- Reactive를 사용하는 의미에서 observer인 .obs를 붇인다.
<br>

---

<br>

- general type
> RxDouble은 final 선언과 값의 변경을 할때 .value로 접근한다.
```
class Reactive {
    RxInt count = 0.obs;
    final RxDouble _double = 0.0.obs;
    
    //update
    void increase(){
        count++;
        _double.value++;
        _double(404);
    }
}
```

<br><br>

- enum
```
enum NUM { FIRST, SECOND }

class Reactive{
    Rx<NUM> nums = NUM.FIRST.obs;
    
    void increase(){
        nums(NUM.SECOND);
    }
}
```

<br><br>

- class
```
class User{
    String? name;
    int? age;
    
    User({this.name, this.age});
}

class Reactive{
    Rx<User> user = User(name: 'hodu', age: 20).obs;
    
    void increase(){
        //한번에 update
        user(User());  
        
        //부분적 update
        user.update((_user){
           _user!.name = 'hodu_angel'; 
        });
    }
}
```

<br><br>

- List
```
class Reactive{
    RxList<String> list = [''].obs;
    
    void increase(){
        list.addAll(['content']);
        list.add('content');
        //만일 user.value.name가 hodu와 같으면 okay를 넣는다.
        list.addIf(user.value.name == 'hodu', 'okay');
    }
}
```