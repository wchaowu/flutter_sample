import 'package:flutter/material.dart';

typedef HeaderWidgetBuild = Widget Function(BuildContext context, int position);

typedef ItemWidgetBuild = Widget Function(BuildContext context, int position);
typedef BottomWidgetBuild = Widget Function(BuildContext context, int position);

class LayoutWidget extends StatefulWidget {
  int headercount = 0;
  int itemCount = 0;
  int bottomCount = 0;
  ItemWidgetBuild itemWidgetCreator;
  HeaderWidgetBuild headerCreator;
  BottomWidgetBuild bottomCreator;

  LayoutWidget(this.itemCount,
      {Key key,
      this.headercount,
      this.bottomCount,
      this.itemWidgetCreator,
      this.headerCreator,
      this.bottomCreator})
      : super(key: key);

  @override
  LayoutState createState() {
    if (this.headerCreator != null) {
      headercount = 1;
    }
    if (this.bottomCreator != null) {
      bottomCount = 1;
    }
    return new LayoutState();
  }
}

class LayoutState extends State<LayoutWidget> {
  int headerCount = 0;
  int itemCount = 0;
  int bottomCount = 0;
  HeaderWidgetBuild headerCreator;
  BottomWidgetBuild bottomWidgetBuild;

  @override
  Widget build(BuildContext context) {
    _initCount();
    int totalCount = _getListCount();
    //  当数量比较少的情况采用非回收的方式
    if (totalCount < 10) {
      List<Widget> list = new List<Widget>.generate(totalCount, (int i) {
        return buildItemWidget(context, i);
      });
      return Container(
          child: new ListView(
        children: list,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ));
    } else {
      return Container(
        child: new ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int position) {
              return buildItemWidget(context, position);
            },
            itemCount: _getListCount()),
      );
    }
  }

  int _getListCount() {
    return headerCount + itemCount + bottomCount;
  }

  void _initCount() {
    headerCount = widget.headercount == null ? headerCount : widget.headercount;
    itemCount = widget.itemCount == null ? itemCount : widget.itemCount;
    bottomCount = widget.bottomCount == null ? bottomCount : widget.bottomCount;
    if (widget.bottomCreator != null) {
      bottomWidgetBuild = widget.bottomCreator;
    }
    if (widget.headerCreator != null) {
      headerCreator = widget.headerCreator;
    }
  }

  Widget _headerItemWidget(BuildContext context, int index) {
    if (widget.headerCreator != null) {
      return widget.headerCreator(context, index);
    } else {
      //  return headerCreator(context, index);
    }
  }

  Widget _bottomItemWidget(BuildContext context, int index) {
    if (widget.bottomCreator != null) {
      return widget.bottomCreator(context, index);
    } else {
      //  return bottomWidgetBuild(context, index);
    }
  }

  Widget buildItemWidget(BuildContext context, int index) {
    if (index < headerCount) {
      return _headerItemWidget(context, index);
    } else if (index >= (headerCount + itemCount)) {
      int pos = index - headerCount - itemCount;
      return _bottomItemWidget(context, pos);
    } else {
      int pos = index - headerCount;
      return _itemBuildWidget(context, pos);
    }
  }

  Widget _itemBuildWidget(BuildContext context, int index) {
    if (widget.itemWidgetCreator != null) {
      return widget.itemWidgetCreator(context, index);
    } else {
      return new GestureDetector(
        child: new Padding(
            padding: new EdgeInsets.all(10.0), child: new Text("Row $index")),
        onTap: () {
          print('click $index --------------------');
        },
      );
    }
  }
}
