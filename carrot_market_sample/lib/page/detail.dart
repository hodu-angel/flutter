import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String>? data;

  DetailContentView({Key? key, this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  Size? size;
  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }
  PreferredSizeWidget _appbarWidget(){
    //transparent 부모의 속성을 따라간다.
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
      ],
    );
  }

  Widget _bodyWidget(){
    return Hero(
      tag: widget.data!['cid'].toString(),
      child: Container(
        child: Image.asset(widget.data!['image'].toString(),
          width: size!.width,
          fit: BoxFit.fill,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //앱바의 뒤로 확장을 하겠다.
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
