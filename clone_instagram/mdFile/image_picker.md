# 갤러리에서 이미지 받아오기
- flutter pub add image_picker
<br><br><br>

- signup_page.dart
```
class _SignupPageState extends State<SignupPage> {
    final ImagePicker _picker = ImagePicker();
    XFile? thumbnailXFile;
    
    void update() => setState(() {});
    
    Widget _avatar(){
        ...
        child: thumbnailXFile != null
            ? Image.file(
                File(thumbnailXFile!.path),
                fit: BoxFit.cover,
            )
            : Image.asset(
                'assets/images/default_image.png',
                fit: BoxFit.cover,
            ),
        
        ...
        ElevatedButton(
            onPressed: () async {
                thumbnailXFile = await _picker.pickImage(
                    source: ImageSource.gallery, imageQuality: 10);
                    update();
            },
            child: const Text('이미지 변경'),
        ),
    }
```