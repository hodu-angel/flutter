# _bodyWidget()-Home()
1. PreferredSizeWidget _appbarWidget()에서 아라동, 오라동, 도남동으로 dropDownButton을 만들고, 해당 지역의 목록을 Widget _bodyWidget()에서 보여준다. 

2. 해당 지역에 데이터가 없으면 '해당 지역에 데이터가 없습니다.', 데이터 오류라면 '데이터 오류' 데이터가 있다면 목록을 보여준다.

3. 아이템의 이미지를 클릭시 점차 확대되면서 상세페이지로 전환한다.
<br><br><br>

<hr>

## PreferredSizeWidget _appbarWidget()
- DropdownButton

> ```
> class _HomeState extends State<Home>{
>     late String currentLocation;
>     final _valueList = ['아라동', '오라동', '도남동'];
>     String _value = '아라동';
>     ...
> 
>     PreferredSizeWidget _appbarWidget(){
>         return AppBar(
>             title: GestureDetector{
>                 onTap: (){
>                   print('click');  
>                 },
>                 child: DropdownButton<String>{
>                     isDense: true,  //dropdownbutton 위치조정
>                     value: _value;
>                     icon: Icon(Icons.arrow_drop_down),
>                     underline: Container(), //밑줄제거
>                     borderRadius: BorderRadius.all(Radius.circular(10),),
>                     
>                     items: _valueList.map((value){
>                         return DropdownMenuItem(
>                             value: value,
>                             child: Text(value),
>                         );
>                     },).toList(),
>                     
>                     onChanged: (value){
>                         setState((){
>                             _value = value!;    //null-safety적용
>                             currentLocation = value;    //현재위치 저장
>                         });
>                     },
>                 },
>             },
>         );
>     }
> ```

<br><br><br>

- 기다렸다 데이터가 처리될때 까지 도와주는 builder

> **contents_repository.dart**
> ```
> Future<List<Map<String, String>>?> loadContentsFromLocation( String location ) async{
>     //API통신 location값을 보내주면서,
>     //1000milli = 1sec
>     await Future.delayed(Duration(milliseconds: 1000));
>     return data[location];
> }
> ```
> <br><br>
> 
> **home.dart**
> ```
> ...
> late ContentsRepository contentsRepository;
> 
> @override
> void didChangeDependencies(){
>     super.didChangeDependencies();
>     contentsRepository = ContentsRepository();
> }
> 
> //선택된 동에 해당되는 내용들을 보여줌
> _loadContents(){
>     return contentsRepository.loadContentsFromLocation(currentLocation);
> }
> 
> Widget _bodyWidget(){
>     return FutureBuilder(
>     //보여줄 내용
>         future: _loadContents(),
>         builder: (context, dynamic snapshot){
>             //snapshot에 data
>             //데이터의 유무 check 필요
>             //연결되기 전이라면 로딩중표시
>             if(snapshot.connectionState != ConnectionState.done){
>                 return Center(child: CircularProgressIndicator());
>             }
>             
>             if(snapshot.hasError){
>                 print(snapshot.error);
>                 return Center(child: Text('데이터 오류');
>             }
>             
>             if(snapshot.hasData){
>                 return _makeDataList(snapshot.data);
>             }
>             
>             return Center(child: Text('해당 지역에 데이터가 없습니다.'));
>         },
>     );
> }
> ```

<br><br><br>

- 페이지 전환

> ```
> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
>     return DetailContentView(
>         data: datas[index],
>     );
> }));
> ```

<br><br><br>

- 이미지 ClipRRect(), Hero animation effect

> ```
> ...
> ClipRRect(
>     borderRadius: BorderRadius.all(Radius.circular(10)),
>     
>     //Hero로 이미지 클릭시 이미지가 점차 확대 되면서 페이지 전환을 이룸
>     child: Hero(
>         tag: datas[index]['cid'].toString(),
>         child: Image.asset(
>             datas[index]['image'].toString(),
>             width: 100,
>             height: 100,
>         ),
>     ),
> ),
> ```
