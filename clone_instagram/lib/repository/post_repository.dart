import 'package:clone_instagram/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostRepository {
  static Future<void> updatePost(Post postData) async {
    await FirebaseFirestore.instance.collection('posts').add(postData.toMap());
  }

  static Future<List<Post>> loadFeedList() async {
    var document = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createdAt', descending: true).limit(10); //limit 10장
    var data = await document.get();
    //post로 data parsing
    return data.docs.map<Post>((e) => Post.fromJson(e.id, e.data())).toList();
  }
}
