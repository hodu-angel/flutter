import 'dart:typed_data';

import 'package:clone_instagram/components/image_data.dart';
import 'package:clone_instagram/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

//내 device의 folder group을 그대로 불러들여서 뿌려주게 할 것임
//의존성을 줄이기 위해 stless Getx에서 statefulWidget을 사용함
//StatefulWidget의 특성상 builder가 재호출되게 된다. 그러므로 _imageSelectList에서 이미지변경시 전체가 reload된다.
class Upload extends GetView<UploadController> {
  Upload({Key? key}) : super(key: key);

  //매번 update를 해야되기에 축약함
  //void update() => setState(() {});

  Widget _imagePreview() {
    var width = Get.width;
    return Obx(() => Container(
          width: width,
          height: width,
          color: Colors.grey,
          child: _photoWidget(controller.selectedImage.value, width.toInt(),
              builder: (data) {
            return Image.memory(
              data,
              fit: BoxFit.cover,
            );
          }),
        ));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //앞 row
          GestureDetector(
            onTap: () {
              //showModalBottomSheet는 default로 backgroundColor가 white다.
              showModalBottomSheet(
                context: Get.context!,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                //height를 주지 않아도 끝까지 확장되어 보여준다.
                isScrollControlled:
                    controller.albums.length > 10 ? true : false,
                //gallery_name이 많으면 SafeArea까지 영역을 침범하게되어 스크롤이 안 될 수 있으므로 top영역을 빼준값을 maxHeight로 지정한다.
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(Get.context!).size.height -
                      MediaQuery.of(Get.context!).padding.top,
                ),
                builder: (_) => Container(
                  //height: albums.length * 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54),
                          width: 40,
                          height: 4,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(
                              //widget이 그려지고 나서 데이터가 들어온다.
                              controller.albums.length,
                              //100,
                              (index) => GestureDetector(
                                onTap: (){
                                  controller.changeAlbum(controller.albums[index]);
                                  Get.back();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  child: Text(controller.albums[index].name),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Obx(()=>Text(
                    controller.headerTitle.value,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  )),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff808080),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    ImageData(IconsPath.imageSelectIcon),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      '여러 항목 선택',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff808080)),
                child: ImageData(IconsPath.cameraIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //SingleChildScrollView와 GridView가 같이 사용되면 오류가 발생한다.
  Widget _imageSelectList() {
    return Obx(()=>GridView.builder(
        //scroll을 하지 않겠다.
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        //SliverGridDelegateWithFixedCrossAxisCount: 몇단계로 쪼갤 것인지.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            //childAspectRatio: 정사각형의 size가 나온다.
            childAspectRatio: 1),
        itemCount: controller.imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return _photoWidget(controller.imageList[index], 200,
              builder: (data) {
            return GestureDetector(
              onTap: () {
                controller.changeSelectedImage(controller.imageList[index]);
                //update();
              },
              child: Obx(() => Opacity(
                    opacity: controller.imageList[index] ==
                            controller.selectedImage.value
                        ? 0.3
                        : 1,
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                    ),
                  )),
            );
          });
        }));
  }

  //asset과 selectedImage가 동일하다면 하얗게 표시해준다.
  Widget _photoWidget(AssetEntity asset, int size,
      {required Widget Function(Uint8List) builder}) {
    return FutureBuilder(
      future: asset.thumbDataWithSize(size, size),
      builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
        if (snapshot.hasData) {
          return builder(snapshot.data!);
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.closeImage),
          ),
        ),
        title: const Text(
          'New Post',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: controller.gotoImageFilter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.nextImage,
                width: 50,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
