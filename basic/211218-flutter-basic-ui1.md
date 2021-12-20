## 화면 구성해보기.

![image](https://user-images.githubusercontent.com/90611410/146630188-951b541b-7538-44a7-adbd-d3fdbca440e9.png)

<hr>
Scaffold를 이용해서 상단 중단 하단으로 나눈다<br><br>

1. 상단의 Text는 AppBar의 title을 이용하여 Text를 삽입하였다.
2. 중단은 Text만 사용하였다.
3. 하단의 BottomAppBar위젯을 이용해 height만 필요하기때문에 SizedBox로 감싸고 아이콘들을 가로축 기준 일정너비 공백을 주었다.
<br><br><br>
<hr>

```
import 'package:flutter/material.dart';

void main() {
  runApp(const Basic());
}

class Basic extends StatelessWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('앱임'),
            ),
            body: Text('안녕'),
            bottomNavigationBar: BottomAppBar(
                //width, height, child만 필요한 박스는 SizedBox() 를 사용함
                child: SizedBox(  //Container는 무겁기때문에 SizedBox가 더 가벼워서 Lint가 잡아준다.
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.phone),
                      Icon(Icons.message),
                      Icon(Icons.contact_page),
                ],
              ),
            )
            )
        )
    );
  }
}
```
<hr>
<br><br><br>
## 완성 <br>
![image](https://user-images.githubusercontent.com/90611410/146630375-116a56ef-5ef9-4173-855d-17342a95616e.png)

