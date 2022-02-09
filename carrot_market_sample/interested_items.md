## flutter_secure_storage
관심상품 저장을 위해 사용됨
https://pub.dev/packages/flutter_secure_storage
<br>

- 관심등록 클릭시 contentsRepository.addMyFavoritContent(widget.data);으로 저장한다. 
**contents_repository.dart**
```
 addMyFavoritContent(Map<String, String>? content){
    //json에 어떻게 string형태로 저장하냐면, jsonEncode()로 자동으로 변환해줘서 저장할 수 있다.
    this.storeValue(MY_FAVORITE_STORE_KEY, jsonEncode(content));
  }
```

<br><br>

- 관심상품등록시 불러오기
**detail.dart**
```
 _loadMyFavoriteContentState() async{
    //내가 좋아하는 contents이면 contents_id를 넘겨줌
    bool ck = await contentsRepository.isMyFavoriteContents(widget.data!['cid']);
    //관심상품등록 되어있으면 색 채우게 함
    setState(() {
      isMyFavoriteContent = ck;
    });
    print(ck);
  }
```