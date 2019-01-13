import 'package:flutter/material.dart';
import 'package:joybuy.com/tools/Utils.dart';
import 'package:joybuy.com/widget/LayoutWidget.dart';
import 'package:joybuy.com/tools/Url.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecommendWidget extends StatefulWidget {
  final itemData;
  final titleData;

  RecommendWidget({Key key, @required this.titleData, @required this.itemData})
      : super(key: key);
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<RecommendWidget> {
  Widget getItemWidget(BuildContext context, int i) {
    var subItem = widget.itemData["skus"][i * 2];
    var subItem2 = widget.itemData["skus"][i * 2 + 1];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(children: [
            CachedNetworkImage(
              //     placeholder: new CircularProgressIndicator(),
              fit: BoxFit.cover,
              //  width: 200,
              imageUrl: EptUtils().cutImage(subItem["productImage"], 200, 200),
            ),
            Text("\$" + subItem["price"],
                style: new TextStyle(fontSize: 12, color: Colors.red),
                textAlign: TextAlign.center),
          ])),
          Expanded(
              child: Column(children: [
            CachedNetworkImage(
              //    placeholder: new CircularProgressIndicator(),
              fit: BoxFit.cover,
              imageUrl: EptUtils().cutImage(subItem2["productImage"], 200, 200),
              width: 200,
            ),
            Text("\$" + subItem2["price"],
                style: new TextStyle(fontSize: 12, color: Colors.red),
                textAlign: TextAlign.center),
          ]))
        ],
        // width: double.maxFinite,
      ),
    );
  }

  Widget getheaderCreator(BuildContext context, int i) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Text(
        widget.titleData['title'].toString(),
        style: new TextStyle(fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
    );
  }

  @override
  Widget build(BuildContext content) {
    double count = (widget.itemData["skus"].length / 2);
    return LayoutWidget(count.toInt(),
        itemWidgetCreator: getItemWidget, headerCreator: getheaderCreator);
  }
}
