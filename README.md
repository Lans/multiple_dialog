# multiple_dialog

This is a magazine with multiple material designs。
including loadingDialog, alertDialog,
 listDialog and continuous addition。。。。。
 Then you can also add custom Dialog, if you have any Suggestions welcome to raise issues on github, if you think it is helpful to you, welcome start.

[![build status](https://img.shields.io/travis/flutterchina/dio/vm.svg?style=flat-square)]()
[![Pub](https://img.shields.io/pub/v/dio.svg?style=flat-square)](https://pub.dev/packages/multiple_dialog)
[![support](https://img.shields.io/badge/platform-flutter%7Cdart%20vm-ff69b4.svg?style=flat-square)](https://github.com/Lans/multiple_dialog)

## Getting Started

    multiple_dialog: ^0.1.6
    
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
                      direction: Direction(
                        message: "加载中",
                        messageStyle:TextStyle();
                        orientations: Orientations.Horizontal,
                        width: 120,
                        height:120,
                      ));
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
  
## 3. showBottomDialog
       
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

## 4. showCustomAlertDialog
     RaisedButton(
                child: Text("showCustomAlertDialog",),
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

## 5. showCustomSimpleDialog
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

## 6. SimpleListDialog
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
              
## 7. CustomDialog
##### gravity changes the position from top to bottom by (-1~1)
 
        showCustomDialog(
               context: context,
               gravity: 0,
               child: Text("showCustomDialog"));
                            

#### If you want to customize the Dialog, you can override showCustomDialog or showCustomAlertDialog
### LICENES

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