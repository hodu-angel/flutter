## IndexedStack
- GetX로 페이지 전환시 각 보여줄 화면
<br><br>

---

- bottomNavController
```
enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
...
 //pageIndex에 각 해당하는 event처리를 여기 method에서 함
  void changeBottomNav(int value) {
    //pageIndex에 해당하는 enum값을 가져오게 된다.
    var page = PageName.values[value];
    switch(page){
      case PageName.HOME:
        break;
      case PageName.SEARCH:
        break;
      case PageName.UPLOAD:
        break;
      case PageName.ACTIVITY:
        break;
      case PageName.MYPAGE:
        break;
    }
    pageIndex(value);
```

<br><br>

- app.dart
```
...
body: IndexedStack(
    index: controller.pageIndex.value,
    children: [
              Container(child: Center(child: Text('HOME')),),
              Container(child: Center(child: Text('SEARCH')),),
              Container(child: Center(child: Text('UPLOADE')),),
              Container(child: Center(child: Text('ACTIVITY')),),
              Container(child: Center(child: Text('MYPAGE')),),
    ],
    ...
),
bottomNavigationBar: BottomNavigationBar(
    ...
    onTap: controller.changeBottomNav,
    ...
)

```