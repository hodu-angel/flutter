# Text입력 TextField()
- border: InputBorder.none //text밑의 밑줄을 제거한다.
- ContentPadding: EdgeInsets.only(left: 15, top:7, bottom: 7)  //text의 위치를 조정한다.
- isDense: true //padding을 주는 만큼 TextField의 간격이 넓어진다.
<br><br>

```
...
child: const TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'content',
        contentPadding: EdgeInsets.only(left: 15, top:7, bottom: 7),
        isDense: true,
    ),
),
```