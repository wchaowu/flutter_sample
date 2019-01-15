import 'package:flutter/material.dart';

class NavWidget extends StatefulWidget {
  final itemData;

  NavWidget({Key key, @required this.itemData}) : super(key: key);

  _NavState createState() => _NavState();
}

class _NavState extends State<NavWidget> {
  List<Widget> getNavRow() {
    var datas = widget.itemData["items"];
    return new List<Widget>.generate(datas.length, (int index) {
      var subItem = widget.itemData["items"][index];
      Widget w = Container(
          child: Column(verticalDirection: VerticalDirection.up, children: [
        new Text(
          subItem["activityName"],
          style: TextStyle(fontSize: 10),
        )
      ]));
      return w;
    });
  }

  @override
  Widget build(BuildContext content) {
    // return Text('detail---${widget.id}');
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
