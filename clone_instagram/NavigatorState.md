# 페이지 전환 Navigator
- 기존 Get.to방식에서 bottomNavi를 그대로 갖고오기 위해 Navigator방식으로 변경했다.

<br><br>

- BottomNavController.dart
```
...
GlobalKey<NavigatorState> searcPageNaviationKey = GlobalKey<NavigatorState>();
...
```

<br><br>

- search.dart
```
...
Navigator(
    key: controller.searchPageNaviationKey,
    onGenerateRoute: (routeSetting){
        return MaterialPageRoute(
            builder: (context) => const Search(),
        );
    },
),
```

