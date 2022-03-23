# Google Login
> https://firebase.flutter.dev/docs/auth/social 참조

<br>

```
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
```

<br><br>
> https://developers.google.com/android/guides/client-auth를 참조하여 C:\Users\userName\.android 폴더에서 gitbash 후 <br>

![image](https://user-images.githubusercontent.com/90611410/159650217-eb2ce8b8-4677-42b3-8598-d2e6e32cb88c.png) 를 추가. <br><br>

```
keytool -list -v -alias androiddebugkey -keystore ./debug.keystore

android
```
