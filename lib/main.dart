import 'package:flutter/material.dart';
import './index/IndexList.dart';
import 'package:flutter/rendering.dart';
import 'search/SearchBar.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  // debugPaintSizeEnabled = true; //打开视觉调试开关
  runApp(MaterialApp(title: "joybuy.com", home: Myhome()));
}

class Myhome extends StatefulWidget {
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext content) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Image.network(
            "https://static.joybuy.com/ept_m/index/v20181225/logo.png",
            fit: BoxFit.fill,
            width: 80,
            height: 15,
          ),
          // centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchList(),
                    ));
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("luowei"),
                accountEmail: Text("luowei@jd.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://static.joybuy.com/ept_m/res/en/launcher-144.png'),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "http://t2.hddhhn.com/uploads/tu/201707/521/82.jpg"))),
              ),
              ListTile(
                title: Text('Home'),
                trailing: Icon(Icons.home),
              ),
              ListTile(
                title: Text('My Orders'),
                trailing: Icon(Icons.info),
              ),
              ListTile(
                title: Text('my Account'),
                trailing: Icon(Icons.input),
              ),
              Divider(),
              ListTile(
                title: Text('Categories'),
                trailing: Icon(Icons.category),
              ),
              Divider(),
              ListTile(
                title: Text('Ship To'),
                trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text('United States',
                                textAlign: TextAlign.right)),
                        // Container(
                        //   child: Icon(Icons.arrow_right),
                        //   width: 10,
                        // )
                      ],
                    )),
              ),
              ListTile(
                title: Text('site'),
                trailing: Container(
                    width: 90,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text('Global Site',
                                textAlign: TextAlign.right)),
                        Container(
                          child: Icon(Icons.arrow_drop_down),
                          width: 10,
                        )
                      ],
                    )),
              ),
              ListTile(
                title: Text('currency'),
                trailing: Container(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          'USD',
                          textAlign: TextAlign.right,
                        )),
                        Container(
                          child: Icon(Icons.arrow_drop_down),
                          width: 10,
                        )
                      ],
                    )),
              ),
              ListTile(
                title: Text('setting'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            IndexList(mt: 'in_theaters'),
          ],
        ),
      ),
    );
  }
}
