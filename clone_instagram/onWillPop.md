## onWillPop
- 앱의 기본 버튼인 뒤로가기를 눌렀을 때 켜져있던 화면을 제거한다.
<br>

- app.dart
```
...
return WillPopScope(
    ...
    onWillPop: controller.willPopAction,
);
```
<br><br>

- bottom_nav_controller.dart
```
...
Future<bool> willPopAction() async{
    if(bottomHistory.length == 1){  //켰던화면이 1개밖에 없다면
        showDialog(
            context: Get.context!,
            builder: (context) => MessagePopup(
                title: '시스템',
                message: '종료하시겠습니까?',
                okCallback: (){
                    exit(0);
                },
                cancelCallback: Get.back,
            ),
        );
        return true;
    } else{
        bottomHistory.removeLast();
        var index = bottomHistory.last;
        changeBottomNav(index, hasGesture: false);
        
        return false;
    }
}
```
<br><br>

- message_popup.dart
```
class MessagePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallback;
  final Function()? cancelCallback;

  const MessagePopup({
    Key? key,
    required this.title,
    required this.message,
    required this.okCallback,
    this.cancelCallback,
  }) : super(key: key);
...
```