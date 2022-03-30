# onInit
- Getx에서 사용되는 method다.
- GetxController를 extends 해야 된다. <br>
- listener가 Rx type으로 선언되어야 한다.
<br>

---

<br>

```
class Reactive extends GetxController{
    RxInt count = 0.obs;
    @Override
    void onInit(){
        //매번 값이 변경될 때마다 호출된다.
        ever(count, (_) => print('매번 호출'));
        
        //한번만 호출
        once(count, (_) => print('한번만 호출'));
        
        //서버로부터 데이터를 받아오거나 사용자가 검색을 할 경우에 쓰인다.
        //사용자가 입력을 어느정도 마무리했거나 검색을 멈췄을때 검색을 도와준다.
        debounce(count, (_) => print('마지막 변경에 한번만 호출', time: const Duration(seconds: 1));
        
        //변경되고 있는 동안에 1초마다 호출
        interval(count, (_) => print('변경되고 있는 동안에 1초마다 호출'), time: const Duration(seconds: 1));
        super.onInit();
    }
}
```