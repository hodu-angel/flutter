import 'package:clone_instagram/components/image_data.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

//내 device의 folder group을 그대로 불러들여서 뿌려주게 할 것임
//의존성을 줄이기 위해 stless Getx에서 statefulWidget을 사용함
class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  var albums = <AssetPathEntity>[];
  var headerTitle = '';

  @override
  void initState() {
    super.initState();
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

  void _loadData() {
    headerTitle = albums.first.name;
  }

  Widget _imagePreview() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width,
      color: Colors.green,
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //앞 row
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text(
                  headerTitle,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xff808080),
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
    return GridView.builder(
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
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.orange,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
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
            onTap: () {},
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
