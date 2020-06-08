import 'package:cmoney/photos.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CPage extends StatelessWidget{
  Photos photos;

  CPage({this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('page_c')),

      ),
      body: PageStatefulWidget(title: tr('page_c'),photos:photos),
    );
  }
}


class PageStatefulWidget extends StatefulWidget{
  PageStatefulWidget({Key key, this.title,this.photos}) : super(key: key);
  final String title;
  Photos photos;
  @override
  _ParentWidgetState createState() => new _ParentWidgetState(photos:photos);
}

class _ParentWidgetState extends State<PageStatefulWidget>{
  Photos photos;
  _ParentWidgetState({this.photos});
  @override
  Widget build(BuildContext context) {
    return getAdapter();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData(){

  }

  _gotoNextPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CPage()));
  }

  int value = 2;

  _addItem() {
    setState(() {
      value = value + 1;
    });
  }



  Widget getAdapter(){
    Widget widget =
    new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex :2,
            child: Image.network(
              '${photos.thumbnailUrl}',
              fit:BoxFit.fill,
              width: 100.0,
              height: 100.0,
            ),

          ),
          Expanded(
              flex: 1,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all( 1.0), //容器外填充
                        color: Colors.purple,
                        child: new Text(
                          "id : " + photos.id.toString(),
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
                          "title : " + photos.title.toString(),
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
                            "thumbnailUrl : " + photos.thumbnailUrl.toString(),
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
        ],
      )
    );
    return widget;
  }
}