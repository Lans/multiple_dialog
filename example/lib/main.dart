import 'package:flutter/material.dart';
import 'package:multiple_dialog/multiple_dialog.dart';
import 'showBottomDialog.dart';

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "自定义dialog",
                ),
              ),
              RaisedButton(
                elevation: 10,
                child: Text("showAlertDialog"),
                onPressed: () {
                  showAlertDialog(
                      context: context,
                      title: Text("标题"),
                      content: Text("我是内容"),
                      semanticLabel: "AlerDialog扩展",
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
                child: Text("showSimpleListDialog"),
                elevation: 10,
                onPressed: () {
                  showSimpleListDialog(
                      context: context,
                      simpleBuilder: SimpleBuilder(),
                      children: <Widget>[
                        for (var i in list) Text(i),
                      ],
                      onItemCallBack: (index) {
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
                  showLoadingDialog(context: context);
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
                      content: Container(child: Text("我是内容")),
                      isScrollControlled: true,
                      backgroundColor: Colors.deepOrange,
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
                  }),
              RaisedButton(
                child: Text(
                  "showCustomAlertDialog",
                ),
                elevation: 10,
                onPressed: () {
                  showCustomAlertDialog(
                      context: context,
                      dialogBuilder: DialogBuilder(
                        simpleBuilder: SimpleBuilder(
                          title: Text("标题"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                for (var i in list)
                                  InkWell(
                                    child: Text(i),
                                    onTap: () {
                                      print(i);
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      confirmWidget: Text("确认"),
                      cancelWidget: Text("取消"),
                      onConfirmCallBack: () {
                        Navigator.pop(context);
                      },
                      onCancelCallBack: () {
                        Navigator.pop(context);
                      });
                },
              ),
              RaisedButton(
                child: Text(
                  "showCustomDialog",
                ),
                elevation: 10,
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    simpleBuilder: SimpleBuilder(),
                    children: <Widget>[Text("自定义CustomDialog")],
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
