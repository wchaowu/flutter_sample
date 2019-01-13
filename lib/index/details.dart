import 'package:flutter/material.dart';

class MoveieDetail extends StatefulWidget{
  MoveieDetail({Key key,@required this.id,@required this.title}):super(key:key);
  final String id;
  final String title;
_MoveieDetailState createState()=> _MoveieDetailState();
}

class _MoveieDetailState  extends State<MoveieDetail>{
  @override
  Widget build(BuildContext content){
    // return Text('detail---${widget.id}');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Text('电影ID为：${widget.id}'),
    );
  }
}