## Custom Widget
Code의 길이를 줄여 사용함으로서 가독성을 높이기 위해 Custom Widget을 사용한다.

변수나 함수로도 문법 축약이 가능하다.(성능상 Issue가 있을 수 있다.)

실시간으로 데이터가 바뀌는 것들은 성능Issue가 생길 수 있기 때문에 Custom Widget으로 작성한다.
<br>

![image](https://user-images.githubusercontent.com/90611410/148370906-4395a44e-f641-495e-bb73-ef5a14c1741c.png)
위 이미지의 body부분의 SizedBox()를 Custom Widget을 이용하여 본 Code의 body의 가독성을 높였다.
<hr><br><br>

## ListView
ListView사이즈보다 내용이 많으면 ScrollBar가 생긴다.

controller - 유저가 얼마나 Scroll을 했는지 실시간으로 파악이 가능하다.

가장 큰 장점으로 메모리 절약이 가능하다.
> 1부터 100중에서 99번째를 보고 있다면 이미 지나온 1~50 들은 삭제가 된다.(성능 개선)

```
ListView(
    controller: ,
    children: [
        Text('안녕'),
        Text('안녕2'),
    ],
)
```