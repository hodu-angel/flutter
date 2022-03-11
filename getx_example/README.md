# GetX
> Flutter 개발을 위한 매우 가볍고 강력한 라이브러리이다. <br>
> 소스관리가 편리하고 clean하다. <br>
> context에 대한 접근이 필요없다. <br>

---

- 3가지의 기본 원칙
1. 생산성
2. 성능
3. 조직화       ex) 부서별 해야하는 일이 다르다.

<br><br>

- GetX 3가지 주요 기능
1. 상태 관리
2. 라우트 관리 - 기존 Navigator와 같은 역할을 하며, GetX의 소스가 조금 더 간결하다. 
3. 종속성 관리 - 사용되지 않는 등록된 Controller를 제거할지 유지할지 관리해준다.

---

- 기존 코드와의 차이점
MaterialApp => GetMaterialApp
> 단순 상태관리만 할 것이라면 MaterialApp을 사용해도 무관하지만, <br>
> GetMaterialApp에서의 주요기능 2가지를 사용하려면 이를 사용한다. <br>

<br><br>

- GetX 사용을 위한 Setting
> https://pub.dev/packages/get/install <br>
> terminal -> flutter pub add get <br>