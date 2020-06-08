import 'dart:convert';

import 'package:cmoney/photos.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CPage.dart';
import 'PhotosList.dart';

class ListPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('page_b')),

      ),
      body: PageStatefulWidget(title: tr('page_b')),
    );
  }
}


class PageStatefulWidget extends StatefulWidget{
  PageStatefulWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<PageStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return getAdapter();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  BaseOptions options = new BaseOptions(
    baseUrl: "https://jsonplaceholder.typicode.com/photos",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  List photoList = new List();
  void getData() async{
    try {
      Response response = await Dio(options).get(options.baseUrl);
      List list = new PhotosList.fromJson(response.data).photoslist;
      setState(() {
        this.photoList = list;
      });
    } catch (e) {
      print(e);
    }
  }

  _gotoNextPage(Photos photos){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CPage(photos:photos)));
  }


  _buildRow(Photos photos) {
    return
      Container(
        margin: EdgeInsets.all( 10.0), //容器外填充
      padding: EdgeInsets.all(10.0),
      color: Colors.lightBlue,
      child:
      InkWell(
          onTap : (){
            print('go to the page C ${photos.title}');
              _gotoNextPage(photos);
          },
          child:new Row(
            /**
             * MainAxisAlignment.end: 縱向終點
                MainAxisAlignment.center: 縱向中心點
                MainAxisAlignment.spaceBetween: 中間留空間
                MainAxisAlignment.spaceAround: 兩邊空間均分
                MainAxisAlignment.spaceEvenly: 均分空間
             */
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex :1,
                  child: Image.network(
                    '${photos.url}',
                    fit:BoxFit.fill,
                    width: 100.0,
                    height: 100.0,
                  ),

                ),
                Expanded(
                    flex: 2,
                    child:
                    Container(
                      margin: EdgeInsets.all( 1.0), //容器外填充
                      color: Colors.deepOrange,
                      child: new Column(
                        /*
                                        CrossAxisAlignment.start: 靠左對齊
                                        CrossAxisAlignment.end: 靠右對齊
                                        CrossAxisAlignment.center: 置中
                                        CrossAxisAlignment.stretch: 佔滿橫向
                                        CrossAxisAlignment.baseline: 橫向對齊 baseline
                                         */
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment:CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all( 1.0), //容器外填充
                              color: Colors.purple,
                              child: new Text(
                                "id :" + photos.id.toString(),
                                style: new TextStyle(fontSize: 22.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all( 1.0), //容器外填充
                              color: Colors.lightGreen,
                              child: new Text(
                                "title :" + photos.title.toString(),
                                style: new TextStyle(fontSize: 22.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ),
                            ),

                            Container(
                                margin: EdgeInsets.all( 1.0), //容器外填充
                                color: Colors.yellow,
                                child: new Text(
                                  "thumbnailUrl 3 " + photos.thumbnailUrl.toString(),
                                  style: new TextStyle(fontSize: 22.0,
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Roboto"),
                                )
                            ),
                          ]
                      ),
                    )
                )
              ]
          )
      )

      );
    //Text("Item " + index.toString());
  }

  Widget getAdapter(){
    Widget widget =
    new Scaffold(
      body: ListView.builder(
          itemCount: this.photoList.length,
          itemBuilder: (context, index) => this._buildRow(photoList[index])),
//      floatingActionButton: FloatingActionButton(
//        onPressed: ,
//        child: Icon(Icons.add),
//      ),
    );
        return widget;
  }
}