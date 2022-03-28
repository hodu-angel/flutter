import 'package:clone_instagram/models/instagram_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static Future<IUser?> loginUserByUid(String uid) async {
    print(uid);
    //users라는 컬렉션을 통해서 조회한다.
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid) //uid가 받아온 uid와 일치하는지 조회한다.
        .get();

    if (data.size == 0) {
      return null;
    } else {
      //first.data() 하는이유는 uid만 찍어볼것이기 때문에 uid는 고유하기 때문에 하나 나올것이므로
      return IUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> signup(IUser user) async {
    try {
      //회원가입성공
      //map형식으로 add해야 된다.
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
