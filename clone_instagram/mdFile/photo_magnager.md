# 갤러리 권한 허용 및 앨범 가져오기 photo_manager

- filterOption의 orders에서 asc: false로 최신순 가져오기가 가능하다. 

<br><br>

- upload.dart
```
class _UploadState extends State<Upload> {
    var albums = <AssetPathEntity>[];
    var headerTitle = '';
    
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
        }
    }
```