import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CPage extends StatelessWidget{
  String index="";

  CPage({this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('page_c')),

      ),
      body: PageStatefulWidget(title: tr('page_c'),index:index),
    );
  }
}


class PageStatefulWidget extends StatefulWidget{
  PageStatefulWidget({Key key, this.title,this.index}) : super(key: key);
  final String title;
  String index="";
  @override
  _ParentWidgetState createState() => new _ParentWidgetState(index:index);
}

class _ParentWidgetState extends State<PageStatefulWidget>{
  String index="";
  _ParentWidgetState({this.index});
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex :2,
            child: Image.network(
              'https://titangene.github.io/images/cover/flutter.jpg',
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
                          "Item " + index.toString(),
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
                          "Item 2" + index.toString(),
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
                            "Item 3 " + index.toString(),
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