# showModalBottomSheet
- isScrollControlled: true이면 SafeArea까지 확장된다.
- constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)로 safeArea영역을 제외해 확장시킬 수 있다.

<br><br>

- upload.dart
```
...
GestureDetector(
    onTap: (){
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
            ),
        ),
        //갤러리의 폴더이름이 10개가 넘으면 safeArea밑까지 확장시킨다.
        isScrollControlled: albums.length > 10 ? true : false,
        contstraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height- MediaQuery.of(context).padding.top,
        ),
        builder: (_) => Container(...),
      );  
    },
),
```