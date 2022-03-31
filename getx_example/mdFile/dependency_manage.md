# dependency_manage
- 페이지 전환시 사용될 controller를 주입시키는 방법이다. <br>
- 메모리에 instance가 쌓이면 느려지게 된다. 그러나 controller가 이를 자동으로 생성, 메모리 삭제까지 한다. <br>
- Get.put과 Get.lazyPut은 자주 사용된다. <br>

---

<br>

- dependency_controller.dart
```
class DependencyController extends GetxController{
    void increase(){}
} 
```

<br>

- get_put.dart
```
...
class GetPut extends StatelessWidget{
    ...
    body: ElevatedButton(
        onPressed: (){
            Get.find<DependencyController>().increase();
        },
        child: const Text('Get.create'),
    ),
}
```

<br>

- get_lazyput.dart
```
class GetlazyPut extends StatelessWidget{
    ...
    body: ElevatedButton(
        onPressed: (){
            Get.find<DependencyController>().increase();
        },
        child: const Text('Get.lazyPut controller 접근'),
    ),
}
```

<br>

---

<br>

- Get.put
> 화면전환시 바로 instance를 생성한다. <br>

```
...
    ElevatedButton(
        onPressed: (){
            Get.to(
                const GetPut(),
                binding: BindingsBuilder((){
                    Get.put(DependencyController());
                }),
            );
        },
        child: const Text('Getput'),
    ),
```
<br>

- Get.lazyPut
> 페이지 전환시 바로 생성하지 않고, controller에 직접 접근시 생성된다. <br>

```
...
    ElevatedButton(
        onPressed: (){
            Get.to(
                const GetlazyPut(),
                binding: BindingsBuilder((){
                     Get.lazyPut<DependencyController>(()=>
                        DependencyController());
                }),
            );
        },
        child: const Text('Get.lazyPut'),
    ),
```
<br>

- Get.putAsync
> Get.put과 작성법이 유사하다. <br>
> 페이지에 접근할 때 비동기식으로 데이터를 받아오거나 가공처리를 하고나서 controller를 instance화 할 때 사용된다. <br>

```
    ElevatedButton(
        onPressed: (){
            Get.to(
                const GetPut(),
                binding: BindingsBuilder((){
                    Get.putAsync(() async {
                    // 5초후 instance 생성
                        await Future.delayed(const Duration(seconds: 5));  //test
                       return DependencyController(); 
                    });
                })
            );
        }
    ),
```
<br>

-  Get.create
> 모든 의존성은 singleton 방식이다. 하나의 instance만 존재한다는 것이다. <br>
> create는 계속 instance를 생성함으로 여러개를 만들 수 있다. <br>

```
    ElevatedButton(
        onPressed: (){
            Get.to(
                const GetPut(),
                binding: BindingsBuilder((){
                    Get.create<DependencyController>(()=>
                        DependencyController());
                }),
            );
        },
        child: const Text('Get.create'),
    ),
```