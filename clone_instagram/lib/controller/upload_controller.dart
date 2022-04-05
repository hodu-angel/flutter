import 'dart:io';

import 'package:clone_instagram/components/message_popup.dart';
import 'package:clone_instagram/controller/auth_controller.dart';
import 'package:clone_instagram/models/post.dart';
import 'package:clone_instagram/pages/upload/upload_description.dart';
import 'package:clone_instagram/repository/post_repository.dart';
import 'package:clone_instagram/utils/data_util.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as imageLib;
import 'package:photofilters/photofilters.dart';

class UploadController extends GetxController {
  var albums = <AssetPathEntity>[];
  RxString headerTitle = ''.obs;
  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  Rx<AssetEntity> selectedImage =
      AssetEntity(id: '0', typeInt: 0, width: 0, height: 0).obs;
  File? filteredImage;
  TextEditingController textEditingController = TextEditingController();
  Post? post;

  @override
  void onInit() {
    super.onInit();
    print('uploadPage');
    post = Post.init(AuthController.to.user.value);
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

  void gotoImageFilter() async {
    var file = await selectedImage.value.file;
    var fileName = basename(file!.path);
    var image = imageLib.decodeImage(file.readAsBytesSync());
    image = imageLib.copyResize(image!, width: 1000);
    var imagefile = await Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => PhotoFilterSelector(
          title: const Text("Photo Filter Example"),
          image: image!,
          filters: presetFiltersList,
          filename: fileName,
          loader: const Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      filteredImage = imagefile['image_filtered'];
      Get.to(() => const UploadDescription());
    }
  }

  void unfocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void uploadPost() {
    unfocusKeyboard();
    print(textEditingController.text);
    var filename = Datautil.makeFilePath();
    var task = uploadFile(
        filteredImage!, '/${AuthController.to.user.value.uid}/${filename}');
    if (task != null) {
      task.snapshotEvents.listen((event) async {
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadUrl = await event.ref.getDownloadURL();
          var updatedPost = post!.copyWith(
            thumbnail: downloadUrl,
            description: textEditingController.text,
          );
          _submitPost(updatedPost);
        }
      });
    }
  }

  UploadTask uploadFile(File file, String filename) {
    var ref = FirebaseStorage.instance.ref().child('instagram').child(filename);
    final metadata = SettableMetadata(
        contentType: 'image/jpng',
        customMetadata: {'picked.file.path': file.path});
    return ref.putFile(file, metadata);
  }

  //firebase로 update
  void _submitPost(Post postData) async {
    await PostRepository.updatePost(postData);
    showDialog(
      context: Get.context!,
      builder: (context) => MessagePopup(
        title: '포스트',
        message: '포스팅이 완료 되었습니다.',
        //rootPage까지 가줘야 된다.
        okCallback: () {
          Get.until((route) => Get.currentRoute == '/');
        },
      ),
    );
  }
}
