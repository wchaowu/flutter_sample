import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWidget extends StatefulWidget {
  final itemData;

  ImageWidget({Key key, @required this.itemData}) : super(key: key);

  _ImageState createState() => _ImageState();
}

class _ImageState extends State<ImageWidget> {
  @override
  Widget build(BuildContext content) {
    // return Text('detail---${widget.id}');

    if (widget.itemData['floorType'] == 10) {
      return getSingleImage();
    }
    if (widget.itemData['floorType'] == 6) {
      return getDoubleImage();
    }
  }

  Container getSingleImage() {
    double imageHeight = 140;
    if (widget.itemData['styleType'] == 2) {
      imageHeight = 175;
    }
    return Container(
        // height: imageHeight,
        margin: EdgeInsets.all(10),
        alignment: Alignment(0.0, 0.0),
        // constraints: BoxConstraints.expand(width: double.maxFinite),
        padding: EdgeInsets.only(left: 0, top: 0),
        child: CachedNetworkImage(
          //   placeholder: new CircularProgressIndicator(),
          fit: BoxFit.cover,
          imageUrl: widget.itemData["clsBanner"][0]["clsImage"],
        ));
  }

  List<Widget> getImageRow() {
    var datas = widget.itemData["items"];
    return new List<Widget>.generate(datas.length, (int i) {
      var subItem = widget.itemData["items"][i];
      return Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.all(2),
              // width: double.maxFinite,
              child: CachedNetworkImage(
                //     placeholder: new CircularProgressIndicator(),
                fit: BoxFit.cover,
                imageUrl: subItem["activityImage"],
              )));
    });
  }

  Container getDoubleImage() {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: getImageRow(),
        ));
  }
}
