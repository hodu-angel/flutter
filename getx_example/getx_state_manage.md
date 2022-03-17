# 단순 상태 관리 GetX
> GetX 는 GetxController를 상속하여 update(); 호출로 업데이트 한다.

- count_controller_with_getx.dart
```
class CountControllerWithGetx extends GetxController{
    int count = 0;  //증가 시킬 변수
    update();  //호출로인해 업데이트 해준다.
}
```
<br><br>

- simple_state_manage_page.dart
```
...
Expanded(
   child: WithGetX(),
)
```
<br><br>

- with_getx.dart
> Get.put(CountControllerWithGetx()); 로 어디서든지 사용이 가능하다.
```
Get.put(CountControllerWithGetx());
return Center(
    child: Column(
        children: [
            GetBuilder<CountControllerWithGetx>(builder: (controller){
                return Text('${controller.count}', style: TextStyle(fontSize: 50));
            }),
            ElevatedButton(
                child: const Text('+', style: TextStyle(fontSize: 50,)),
                onPressed: (){
                    Get.find<CountControllerWithGetx>().increase();
                }
            ),
        ],
    ),
);
```