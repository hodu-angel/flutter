# Text의 여러 스타일 한번에 적용 Text.rich()
- 서로다른 스타일의 Text를 한번에 사용하기 위함.
- children 사용이 가능하다.

<br>

```
...
child: Text.rich(
    TextSpan(
        text: 'hodu_angel',
        style: TextStyle(
            fontWeight: FontWeight.bold,
        ),
        children: [
            TextSpan(
                title: '님이 회원님의 게시물을 좋아합니다.',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                ),
            ),
            TextSpan(
                title: ' 5 일전',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.black54,
                ),
            ),
        ],
    ),
),
```

<br>

---
![Text rich_image](https://user-images.githubusercontent.com/90611410/157206168-8da304b4-5c36-4dae-bc22-19319b441e38.PNG)