import 'package:flutter/material.dart';
import '../tools/Utils.dart';
import "package:joybuy.com/tools/NumberPart.Dart";
import 'package:joybuy.com/widget/LayoutWidget.dart';
import 'package:joybuy.com/tools/Url.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BestSellersWidget extends StatefulWidget {
  final itemData;
  final titleData;
  final moreData;

  BestSellersWidget(
      {Key key,
      @required this.titleData,
      @required this.itemData,
      @required this.moreData})
      : super(key: key);
  _BestSellersState createState() => _BestSellersState();
}

class _BestSellersState extends State<BestSellersWidget> {
  var layout;
  Widget getItemWidget(BuildContext context, int i) {
    int length = widget.itemData['skus'].length;
    if (length > 5) {
      length = 5;
    }
    List<Color> topColor = [
      Color.fromARGB(255, 232, 48, 48),
      Color.fromARGB(255, 226, 95, 48),
      Color.fromARGB(255, 229, 177, 52),
      Colors.grey,
    ];
    // return new GestureDetector(
    //   child: Container(
    //     margin: EdgeInsets.only(top: 0),
    // child: new ListView.builder(
    //     shrinkWrap: true,
    //     scrollDirection: Axis.vertical,
    //     itemCount: length,
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (BuildContext ctx, int i) {
    var subItem = widget.itemData["skus"][i];
    var colorIndex = i < topColor.length ? i : topColor.length - 1;

    return Container(
      color: Colors.white,
      height: 130,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
          onTap: () {
            Url.launchDetailURL(subItem["skuId"].toString());
          },
          // width: double.maxFinite,
          child: Row(verticalDirection: VerticalDirection.up, children: [
            Container(
              padding: EdgeInsets.all(10),
              child: CachedNetworkImage(
                //   placeholder: new CircularProgressIndicator(),
                fit: BoxFit.fill,
                imageUrl:
                    EptUtils().cutImage(subItem["productImage"], 130, 130),
                width: 130,
              ),
            ),
            Container(
              child: ClipPath(
                clipper: new NumberPart(radius: 0.0),
                child: Container(
                  height: 30,
                  width: 20,
                  padding: EdgeInsets.only(top: 5, left: 3),
                  color: topColor.elementAt(colorIndex),
                  child: Text(
                    " " + (i + 1).toString() + " ",
                    style: new TextStyle(
                        //   background: paint,
                        fontSize: 12.0,
                        color: Colors.white),
                  ),
                ),
              ),
              width: 30,
              alignment: Alignment.topCenter,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //对齐方式：平均间隔
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(subItem["productName"],
                        style: new TextStyle(fontSize: 14, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.grey,
                        ),
                        Text("(" + 88.toString() + ")",
                            style:
                                new TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("\$ " + subItem["price"],
                          style: new TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center),
                    ),
                    Divider()
                  ],
                ),
              ),
            )
          ])),
    );
    // ),
    // );
  }

  Widget getheaderCreator(BuildContext context, int position) {
    return Container(
      height: 40,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          new Text(
            widget.titleData['title'].toString(),
            style: new TextStyle(fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget getBottomCreator(BuildContext context, int position) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 35,
      width: double.maxFinite,
      margin: EdgeInsets.all(2),
      decoration: new BoxDecoration(
        color: Color.fromARGB(255, 246, 246, 246),
        // border: Border(top: BorderSide.none,bottom: BorderSide(width: 2)),

        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
      ),
      //     alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          new Text(
            widget.moreData['more']['title'].toString() + " >",
            style: new TextStyle(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext content) {
    // return Text('detail---${widget.id}');
    int itemCount = widget.itemData['skus'].length;
    if (itemCount > 5) {
      itemCount = 5;
    }

    layout = LayoutWidget(itemCount,
        itemWidgetCreator: getItemWidget,
        headerCreator: getheaderCreator,
        bottomCreator: getBottomCreator);

    return layout;
  }
}
