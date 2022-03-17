# 단순 상태 관리 Provider
> controller 는 ChangeNotifier를 상속하여 notifyListeners(); 호출로 업데이트 한다.

- count_controller_with_provider.dart
```
class CountControllerWithProvider extends ChangeNotifier{
    int count = 0;  //증가 시킬 변수
    notifyListeners();  //호출로인해 업데이트 해준다.
}
```
<br><br>

- simple_state_manage_page.dart
```
...
Expanded(
    child: ChangeNotifierProvider<CountControllerWithProvider>(
        create: (_) => CountControllerWithProvider,
        child: const WithProvider(),
    ), 
)
```
<br><br>

- with_provider.dart
```
return Center(
    child: Column(
        children: [
            Consumer<CountControllerWithProvider>(builder: (_, snapshot, child){
                return Text(
                    '${snapshot.count}',
                    style: const TextStyle( fontSize:50,),
                );
            }),
            ElevatedButton(
                child: const Text('+'),
                onPressed: (){
                    Provider.of<CountControllerWithProvider>(context, listen: false).increase();
                }
            ),
        ],
    ),
);
```