# multiple_dialog

This is a magazine with multiple material designs。
including loadingDialog, alertDialog, bottomDialog, listDialog and continuous addition。。。。。

## Getting Started

## How to use
    multiple_dialog: ^0.0.1
    
    import 'package:multiple_dialog/multiple_dialog.dart';

## 1. showLoadingDialog

    RaisedButton(
                elevation: 10,
                child: Text(
                  "showLoadingDialog",
                ),
                onPressed: () {
                  showLoadingDialog(
                    context: context,
                    backgroundColor: Colors.white,
                    direction: Direction.Vertical,
                  );
                },
              ),
## 2. showAlertDialog

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

## 3. showListDialog

     final list = [
        "列表1",
        "列表2",
        "列表3",
        "列表4",
        "列表5",
      ];
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
         
## 4. showBottomDialog
       
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

##LICENES

    Copyright 2019 Lans
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
       http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.