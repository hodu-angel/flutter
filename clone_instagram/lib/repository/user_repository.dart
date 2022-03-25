import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static Future<bool?> loginUserByUid(String uid) async {
    print(uid);
    //users라는 컬렉션을 통해서 조회한다.
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid) //uid가 받아온 uid와 일치하는지 조회한다.
        .get();

    if (data.size == 0) {
      return null;
    } else {
      //first.data() 하는이유는 uid만 찍어볼것이기 때문에 uid는 고유하기때문에 하나 나올것이므로
      print(data.docs.first.data());
      return true;
    }
  }
}
