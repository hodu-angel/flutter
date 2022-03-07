# 갤러리 권한 허용 및 갤러리 가져오기 photo_manager

- **flutter pub add photo_manager로 library**를 추가한다.
- filterOption의 orders에서 asc: false로 최신순 가져오기가 가능하다. 

<br><br>

- 갤러리 권한 얻어오기
```
class _UploadState extends State<Upload> {
    var albums = <AssetPathEntity>[];
    var imageList = <AssetEntity>[];
    var headerTitle = '';
    AssetEntity? selectedImage;
    
    void _loadPhotos() async {
    //권한 얻어오기
        var result = await PhotoManager.requestPermissionExtend();
        if(result.isAuth){
            albums = await PhotoManager.getAssetPathList(
                type: RequestType.image,
                filterOption: FilterOptionGroup(
                    imageOption: const FilterOption(
                        sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
                    ),
                    orders: [
                    //최신 image 먼저 보여준다.
                        const OrderOption(type: OrderOptionType.createDate, asc: false),
                    ],
                ),
            );
            _loadData();
        } else {}
    }
```

<br><br>

- 갤러리 데이터들 가져오기
```
void _loadData() async{
    headerTitle = albums.first.name;
    await _pagingPhotos();
    update();
}
```

<br><br>

- 호출될 때마다 동기화 될 갤러리 페이지 불러오기
```
Future<void> _pagingPhotos() async {
    //album의 최대 30장 정도 불러온다.
    var photos = await ablums.first.getAssetListPaged(0,30);
    imageList.addAll(photos);
    selectedImage = imageList.first;
}
```

<br><br>

- 매번 상태 저장해주기
```
void update() => setState(() {});
```

<br><br>

- 선택한 이미지 보여주기
```
Widget _photoWidget(AssetEntity asset, int size,
{required Widget Function(Uint8List) builder}){
    return FutureBuilder(
        future: asset.thumbDataWithSize(size, size),
        builder: (_, AsyncSnapshot<Uint8List?> snapshot){
            if(snapshot.hasData){
                return builder(snapshot.data!);
            } else {
                return Container();
            }
        },
    );
}
```