# Flutter Lifecycle

![lifecycle](https://user-images.githubusercontent.com/90611410/214870790-417491d8-c66b-48cd-b503-46d9728def79.png)

### createState()
- 새로운 Stateful 위젯을 만들 때 호출되며, 필수 메서드이다. 연결된 State의 인스턴스를 반환한다.
<br>

### initState()
- 위젯이 생성될 때 처음으로 호출되는 메서드이다.
- build 이전에 오직 한 번만 실행되며, 반드시 `super.initState()`를 호출해야 된다.

주로 사용되는 경우) 
 1. 생성된 위젯 인스턴스의 buildContext에 의존적인 것들의 데이터 초기화.
 2. 동일 위젯 트리 내에 부모 위젯에 의존하는 속성 초기화.
 3. Stream 구독, 알림변경, 위젯의 데이터를 변경할 수 있는 다른 객체 핸들링.
<br>

### build()
- 자주 호출되는 메서드이다.
- 반드시 Widget을 리턴해야 되며, 화면의 모든 UI위젯 랜더링을 할 때마다 호출한다.
<br>

### didChangeDependencies()
- 위젯이 최초 생성될 때 `initState` 다음에 바로 호출된다.
- 위젯이 의존하는 데이터의 객체를 호출될 때마다 호출된다.(ex. 업데이트 되는 위젯을 상속한 경우)
<br>

### didUpdateWidget(Widget oldWidget)
- 부모 위젯이 변경되어 이 위젯을 재구성 해야되는 경우에 사용된다.
- 자주 사용되진 않는다.
<br>

### dispose()
- State객체가 영구히 제거된다.
<br>

### deactivate()
- 위젯 트리에서 위젯이 제거 될 때 호출된다.
- state가 위젯 트리의 한 지점에서 다른 지점으로 이동할 때, 현재 프레임 변경이 완료되기 전에 다시 주입될 수 있다.
- 거의 사용되지 않는다.
<br>

### mounted(false)
- false 상태에서 state 객체는 다시 mount 되지 않으며, `setState()`가 호출되면 에러가 발생한다.
- background에서 상태 확인을 위해 사용한다.