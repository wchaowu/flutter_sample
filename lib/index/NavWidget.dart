import 'package:flutter/material.dart';

class NavWidget extends StatefulWidget {
  final itemData;

  NavWidget({Key key, @required this.itemData}) : super(key: key);

  _NavState createState() => _NavState();
}

class _NavState extends State<NavWidget> {
  List<Widget> getNavRow() {
    var datas = widget.itemData["items"];
    List<Widget> list = new List();
    for (int i = 0; i < datas.length; i++) {
      var subItem = widget.itemData["items"][i];
      Widget w = Container(

          //  padding: EdgeInsets.all(22),
          // width: double.maxFinite,
          child: Column(verticalDirection: VerticalDirection.up, children: [
        new Text(
          subItem["activityName"],
          style: TextStyle(fontSize: 10),
        )
      ]));
      list.add(w);
    }
    return list;
  }

  @override
  Widget build(BuildContext content) {
    // return Text('detail---${widget.id}');
    int length = widget.itemData['items'].length;
    return Container(
      //   color: Colors.white,

      decoration: new BoxDecoration(
        image: new DecorationImage(
            alignment: Alignment.center,
            image: new NetworkImage(widget.itemData["bgImg"]),
            fit: BoxFit.fill,
            repeat: ImageRepeat.noRepeat),
      ),
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(10),
      child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 30,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.only(top: 10, left: 10),
              child: new Text(
                widget.itemData['title'].toString(),
                style: new TextStyle(fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
                child: Container(
              height: 120,
              margin: EdgeInsets.only(top: 0),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: getNavRow(),
                  )),
            ))
          ]),
      height: 140,
    );
  }
}
