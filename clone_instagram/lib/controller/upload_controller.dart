import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadController extends GetxController {
  var albums = <AssetPathEntity>[];
  RxString headerTitle = ''.obs;
  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  Rx<AssetEntity> selectedImage =
      AssetEntity(id: '0', typeInt: 0, width: 0, height: 0).obs;

  @override
  void onInit() {
    super.onInit();
    print('uploadPage');
    _loadPhotos();
  }

  void _loadPhotos() async {
    //permission 가져오기
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
          ),
          orders: [
            //asc: false : 최신 image먼저 보여준다.
            const OrderOption(type: OrderOptionType.createDate, asc: false),
          ],
        ),
      );
      _loadData();
    } else {}
  }

  void _loadData() async {
    changeAlbum(albums.first);
    //headerTitle(albums.first.name);
    //update();
  }

  Future<void> _pagingPhotos(AssetPathEntity album) async {
    //앨범 변경시 페이지 초기화를 한번씩 해줘야 된다.
    imageList.clear();

    //pageSize: 몇장을 불러올 것인지.
    var photos = await album.getAssetListPaged(0, 30);
    imageList.addAll(photos);
    //첫번째 이미지 변경
    changeSelectedImage(imageList.first);
  }

  changeSelectedImage(AssetEntity image) {
    selectedImage(image);
  }

  void changeAlbum(AssetPathEntity album) async {
    headerTitle(album.name);
    await _pagingPhotos(album);
  }
}
