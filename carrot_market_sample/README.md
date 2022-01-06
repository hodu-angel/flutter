# Carrot_Market_Sampel
이 프로젝트는 당근 마켓의 목록 화면을 구성해 본 것이다.
<br><br>


- **상단바**<br>

![image](https://user-images.githubusercontent.com/90611410/148369821-e3514e8e-90d3-488f-b5f8-4e43e52e8743.png)
<br>

title영역에 Text, Icon 사용. GestureDetector(또는 InkWell)를 사용해 해당 버튼인식을 준다.
actions 영역에 Icon들을 배치.
<br><br><br>

- **content**<br>

![image](https://user-images.githubusercontent.com/90611410/148370099-ac4d8d8a-2fbf-44ff-b626-b3075558939d.png)
<br>

아이템 하나의 전체를 큰 틀(Container)로 잡고 이미지 사진과 정보를 Row로 나눈다.
이미지 사진에 round를 입히기 위해 ClipRRect위젯을 감싸준다.
<br>
이미지에 대한 정보를 Container로 감싸고 그 안의 내용들도 Column으로 Expanded로 일정간격을 분배한다.
<br><br><br>

- **하단바**<br>

![image](https://user-images.githubusercontent.com/90611410/148370360-eaa49d57-499b-4014-9b3b-4cbdcdaef313.png)
