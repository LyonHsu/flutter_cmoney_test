import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info/package_info.dart';

import 'ListPage.dart';
import 'menu_drawer.dart';


void main() {

  runApp(EasyLocalization(
    child: MyApp(),
    // 支持的语言
    supportedLocales: [Locale('zh', 'CN')],
    // 语言资源包目录
    path: 'resources/langs',
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tr('title'),

      //導入語言包
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: tr('title')),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child:MenuStatefulWidget()
      ),
      body: Stack(
        alignment:Alignment.topCenter , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all( 10.0), //容器外填充,
              padding: EdgeInsets.all( 10.0), //容器外填充,
              child: Text(tr('cmoney_test'),style: TextStyle(color: Colors.white),softWrap: true,),
              color: Colors.lightBlue,
            ),
          ),


          Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child:RaisedButton(key:null,
                    onPressed:buttonPressed,
                    color: const Color(0x88ccaa00),
                    child:
                    new Text(
                      tr('button1'),
                      style: new TextStyle(fontSize:32.0,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Merriweather"),
                    )
                ),
            ),
          ),

        ],
      ),
    );
  }

  void buttonPressed(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
  }
  void loadData(){

  }

}
