

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:package_info/package_info.dart';

String _appVersion = '0.0.0';

class MenuStatefulWidget extends StatefulWidget {
  MenuStatefulWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<MenuStatefulWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initVersion();
  }
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Lyon flutter make app'),
          accountEmail: Text(_appVersion),
          currentAccountPicture: Image.asset('resources/images/lyonhsu3_t.png'),
          decoration: BoxDecoration(color: Colors.grey),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text(tr('about_Me')),
          onTap: () {
            Navigator.pop(context);
            showMyMaterialDialog(context);
          },
        ),
      ],
    );
  }



  void showMyMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("title"),
            content: new Text(
              tr('title'),
              // 加大字体, 便于演示
              style: TextStyle(fontSize: 30),),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text(tr('ok')),
              ),
              IconButton(
                onPressed: (){
                  send();
                },
                icon: Icon(Icons.mail),
              )
            ],
          );
        });
  }

  Future initVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var localVersion = packageInfo.version;
    var buildNumber = packageInfo.buildNumber;
    print('initVersion() localVersion:$localVersion buildNumber=$buildNumber');
    setState(() {
      _appVersion = 'ver:$localVersion($buildNumber)';
    });
  }

  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'lejiteyu@gmail.com',
  );

  var _subjectController = TextEditingController(text: tr('app_name')+'The subject $_appVersion');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    _subjectController = TextEditingController(text: tr('app_name')+'The subject $_appVersion');
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }
}