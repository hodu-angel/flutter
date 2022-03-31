# controller 사용법 3가지
1. Get.find 사용 <br>
2. static 선언 후 class.to로 호출 사용 <br>
3. GetView<controller_class_name> 사용 <br>

--- 

## Get.find<controller_class_name>
```
    ...
    ElevatedButton(
        onPressed: (){
            Get.find<CountControllerWithGetx>().increase();
        },
        child: const Text(
            '+',
            style: TextStyle(
                fontSize: 40,
            ),
        ),
    ),
```

<br><br>

## static 선언, class.to 호출
- count_controller_with_getx.dart
```
class CountControllerWithGetx extends GetxController{
    static CountControllerWithGetx get to => Get.find();
    ...
}
```
<br>

- binding.dart
```
    ...
    GetBuilder<CountControllerWithGetx>(builder: (_){
        return Text(
            _.count.toString(),
            style: TextStyle(fontSize: 40),
        );
    }),
    
    ElevatedButton(
        onPressed: (){
            CountControllerWithGetx.to.increase();
        },
        child: const Text(
            '+',
            style: TextStyle(
                fontSize: 40,
            ),
        ),
    ),
```

<br><br>

## implements GetView
> extends GetView<controller_class_name> 상속한다. <br>
> GetView 자체적으로 controller를 포함하고 있어, controller로 접근이 가능하다. <br>
<br>

- binding.dart
```
class BindingPage extends extends GetView<controller_class_name> {
    ...
    Obx(
        ()=> Text(
                controller.count.toString(),
                style: TextStyle(fontSize: 40),
        ),
    ),
    
    ElevatedButton(
        onPressed: (){
            controller.increase();
        },
        child: const Text(
            '+',
            style: TextStyle(fontSize: 30),
        ),
    ),
}
```