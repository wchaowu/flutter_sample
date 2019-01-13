import 'package:flutter/material.dart';
import '../tools/Utils.dart';
import 'dart:async';
import 'package:joybuy.com/tools/Url.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';

class SupperDealsWidget extends StatefulWidget {
  var itemData;
  var titleData;
  var moreData;

  SupperDealsWidget(
      {Key key,
      @required this.titleData,
      @required this.itemData,
      this.moreData})
      : super(key: key);
  _SupperDealsState createState() => _SupperDealsState();
}

class _SupperDealsState extends State<SupperDealsWidget> {
  /// 倒计时的计时器。
  Timer _timer;
  int _hours = 11;
  int _minutes = 59;

  /// 当前倒计时的秒数。
  int _seconds = 59;
  static final Random random = Random(1000);

  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds == 0) {
          _seconds = 59;
          return;
        } else {
          --_seconds;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    _seconds = 59;
  }

  Widget build(BuildContext content) {
    // return Text('detail---${widget.id}');
    int length = widget.itemData['skus'].length;

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  new Text(
                    widget.titleData['title'].toString(),
                    style: new TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                  new Container(
                      child: new Row(children: [
                    new Text(
                      "These deals end in ",
                      style: new TextStyle(fontSize: 10, color: Colors.grey),
                      textAlign: TextAlign.right,
                    ),
                    new Text(
                      " $_hours : $_minutes : $_seconds",
                      style: new TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ])),
                ],
              ),
            ),
            new Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 0),
                child: new ListView(
                  addSemanticIndexes: false,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: getList(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Text(
                widget.moreData['more']['title'].toString() + " >",
                textAlign: TextAlign.center,
              ),
            ),
          ]),
      height: 250,
    );
  }

  List<Widget> getList() {
    int length = widget.itemData['skus'].length;
    List<Widget> list = List();
    for (var i = 0; i < length; i++) {
      final int goodsProgress = random.nextInt(100);
      Widget w = getItem(i);
      widget.itemData["skus"][i]["goodsProgress"] = goodsProgress.toString();
      list.add(w);
    }
    return list;
  }

  Container getItem(int i) {
    var subItem = widget.itemData["skus"][i];

    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.all(5),
      child: InkWell(
          onTap: () {
            Url.launchDetailURL(subItem["skuId"].toString());
          },
          child: Container(
              child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      color: Color(0xfffaa400),
                      child: Row(
                        children: [
                          Text(
                            subItem["goodsProgress"],
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: "serif"),
                          ),
                          Column(
                            children: <Widget>[
                              Text("%",
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.0,
                                      fontFamily: "serif")),
                              Text("off",
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.0,
                                      fontFamily: "serif"))
                            ],
                          )
                        ],
                      ))),
              Container(
                  padding:
                      EdgeInsets.only(top: 20, left: 2, right: 2, bottom: 2),
                  // width: double.maxFinite,
                  child: Column(
                      verticalDirection: VerticalDirection.down,
                      children: [
                        CachedNetworkImage(
                          //     placeholder: new CircularProgressIndicator(),
                          imageUrl: EptUtils()
                              .cutImage(subItem["productImage"], 100, 100),
                          width: 100,
                          height: 100,
                        ),
                        Text("\$" + subItem["price"],
                            style:
                                new TextStyle(fontSize: 12, color: Colors.red),
                            textAlign: TextAlign.center),
                        Text("\$" + subItem["marketPrice"],
                            style:
                                new TextStyle(fontSize: 12, color: Colors.grey),
                            textAlign: TextAlign.center),
                      ]))
            ],
          ))),
    );
  }
}
