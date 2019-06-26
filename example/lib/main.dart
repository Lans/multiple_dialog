import 'package:flutter/material.dart';
import 'package:multiple_dialog/multiple_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'dialog扩展'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = [
    "列表1",
    "列表2",
    "列表3",
    "列表4",
    "列表5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: InkWell(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                elevation: 10,
                child: Text("showAlertDialog"),
                onPressed: () {
                  showAlertDialog(
                      context: context,
                      title: Text("标题"),
                      content: Text("我是内容"),
                      semanticLabel: "AlertDialog扩展",
                      actions: <Widget>[
                        FlatButton(
                          child: Text("确认"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ]);
                },
              ),
              RaisedButton(
                elevation: 10,
                child: Text(
                  "showListDialog",
                  style: _style(),
                ),
                onPressed: () {
                  showListDialog<String>(
                      title: Padding(
                        child: Text("标题"),
                        padding: EdgeInsets.all(4),
                      ),
                      context: context,
                      onConfirmCallBack: () {
                        Navigator.pop(context);
                      },
                      onCancelCallBack: () {
                        Navigator.pop(context);
                      },
                      children: <Widget>[
                        for (String str in list)
                          Container(
                            height: 20,
                            child: Text(str),
                          ),
                      ],
                      onItemCallBack: (int index) {
                        print(list[index]);
                      });
                },
              ),
              RaisedButton(
                elevation: 10,
                child: Text(
                  "showLoadingDialog",
                  style: _style(),
                ),
                onPressed: () {
                  showLoadingDialog(
                    context: context,
                    backgroundColor: Colors.white,
                    direction: Direction.Vertical,
                  );
                },
              ),
              RaisedButton(
                elevation: 10,
                child: Text(
                  "showBottomDialog",
                  style: _style(),
                ),
                onPressed: () {
                  showBottomDialog(
                    context: context,
                    title: Text("标题"),
                    content: Container(
                      child:
                          Text("我是内容是您的拉回答阿里的哈里还打开了很大很大了洪都拉斯肯定会客户大老虎大老虎的拉黑hh"),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("确认"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text("取消"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              ),
              RaisedButton(
                elevation: 10,
                child: Text(
                  "showTimePickerDialog",
                  style: _style(),
                ),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2030),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _style() {
    return TextStyle(color: Colors.black);
  }
}
