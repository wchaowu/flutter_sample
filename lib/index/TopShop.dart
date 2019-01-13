import 'package:flutter/material.dart';
import '../tools/Utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopShopWidget extends StatefulWidget {
  var itemData;
  var titleData;

  TopShopWidget({Key key, @required this.titleData, @required this.itemData})
      : super(key: key);
  _TopShopState createState() => _TopShopState();
}

class _TopShopState extends State<TopShopWidget> {
  List<Widget> _getProductList() {
    var skus = widget.itemData["skus"];
    List<Widget> list = List();
    for (var i = 0; i < skus.length; i++) {
      var subItem = skus[i];
      Widget widget = Expanded(
          child: Container(
              //   height: 250,
              padding: EdgeInsets.all(10),
              child:
                  Column(verticalDirection: VerticalDirection.down, children: [
                CachedNetworkImage(
                  //    placeholder: new CircularProgressIndicator(),
                  // height: 80,
                  fit: BoxFit.cover,
                  imageUrl:
                      EptUtils().cutImage(subItem["productImage"], 200, 200),
                ),
                Text("\$" + subItem["price"],
                    style: new TextStyle(fontSize: 12, color: Colors.red),
                    textAlign: TextAlign.center),
              ])));

      list.add(widget);
    }
    return list;
  }

  @override
  Widget build(BuildContext content) {
    // return Text('detail---${widget.id}');
    int length = widget.itemData['skus'].length;
    return Container(
        // height: 300,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: new AspectRatio(
          aspectRatio: 1.1 / 1, //横纵比 长宽比  3:2
          child: Column(
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Text(
                        widget.titleData['title'].toString(),
                        style: new TextStyle(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  child: Container(
                      margin: EdgeInsets.only(top: 0),
                      decoration: new BoxDecoration(
                        //  border: new Border.all(width: 2.0, color: Colors.red),
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              new NetworkImage(widget.itemData["bannerImage"]),
                          // centerSlice:
                          //     new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),
                      ),
                      //  constraints: BoxConstraints.expand(height: 350),
                      //  alignment: Alignment.bottomCenter,
                      child: Column(
                        //alignment: Alignment(0, 0.3),

                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Column(children: <Widget>[
                              Text(widget.itemData["title1"].toString(),
                                  style: new TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center),
                              Text(widget.itemData["title12"].toString(),
                                  style: new TextStyle(
                                      fontSize: 13, color: Colors.white),
                                  textAlign: TextAlign.center)
                            ]),
                            height: 60,
                          ),
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    border: new Border.all(
                                        width: 2.0, color: Colors.white),

                                    // centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: _getProductList(),
                                  )))
                        ],
                      )),
                )
              ]),
        ));
  }
}
