import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SliderWidget extends StatefulWidget {
  SliderWidget({Key key, @required this.itemData}) : super(key: key);
  final itemData;
  _SliderWidgetData createState() => _SliderWidgetData();
}

class _SliderWidgetData extends State<SliderWidget> {
  @override
  Widget build(BuildContext content) {
    var banner = widget.itemData['banner'];
    final int length = banner.length;
    String bgImg = widget.itemData['bgImg'];

    return Stack(
      alignment: new Alignment(0, 1),
      children: [
        Container(
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                banner[index]["bannerImage"],
                fit: BoxFit.fill,
              );
            },
            itemCount: length,
            autoplay: true,
            pagination: new SwiperPagination(
              margin: EdgeInsets.all(100.0),
            ),
            //control: new SwiperControl(),
          ),
          height: 400,
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: new Image(
            image: NetworkImage(bgImg),
          ),
        )
      ],
    );
  }
}
