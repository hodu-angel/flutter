# binding 처리 방식 3가지
1. 직접 일일이 binding 처리 <br>
2. app 실행시 binding 처리 <br>
3. binding dart file을 분리하여 한번에 처리 <br>

---
## 일일이 binding
```
    ElevatedButton(
        onPressed: (){
            Get.to(
                const GetPut(),
                binding: BindingBuilder((){
                    Get.put(DependencyController());
                }),
            );
        }
    ),
```
<br><br>

## app 실행 시 binding
- main.dart
```
...
getPages: [
    GetPage(
        name: '/binding',
        page: () => const BindingPage(),
        binding: BindingPageBinding(),
    ),
],
```
<br>

- home.dart
```
    ElevatedButton(
        onPressed: (){
            Get.toNamed('/binding');
        },
        child: const Text('바인딩 관리'),
    ),
```

<br><br>

## dart file separate
> Bindings를 implements 해야 된다. <br>
> 필수로 dependencies override 해야 된다. <br>

- binding_page.dart
```
class BindingPageBinding implements Bindings{
    @override
    void dependencies(){
        Get.put(CountControllerWithGetx());
    }
}
```