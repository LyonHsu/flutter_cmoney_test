import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    initData();
  }

  void initData(){

  }

  int value = 2;

  _addItem() {
    setState(() {
      value = value + 1;
    });
  }

  _buildRow(int index) {
    return
      Container(
        margin: EdgeInsets.all( 10.0), //容器外填充
      padding: EdgeInsets.all(10.0),
      color: Colors.lightBlue,
      child:
      new Row(
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
              'https://titangene.github.io/images/cover/flutter.jpg',
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
          ]
        )
      );
    //Text("Item " + index.toString());
  }

  Widget getAdapter(){
    Widget widget =
    new Scaffold(
      body: ListView.builder(
          itemCount: this.value,
          itemBuilder: (context, index) => this._buildRow(index)),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
        return widget;
  }
}