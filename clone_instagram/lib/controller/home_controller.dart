import 'package:clone_instagram/models/post.dart';
import 'package:clone_instagram/repository/post_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxList<Post> postList = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFeedList();
  }

  void _loadFeedList() async{
    var feedList = await PostRepository.loadFeedList();
    postList.addAll(feedList);
    //print(feedList.length);
  }
}