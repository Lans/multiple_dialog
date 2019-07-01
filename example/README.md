# multiple_dialog

This is a magazine with multiple material designs。
including loadingDialog, alertDialog, bottomDialog, listDialog and continuous addition。。。。。

 <img src="https://github.com/Lansmultiple_dialog/blob/master/enframe_2019-06-28-15-36-35.png" width=200 height=350 />,
 <img src="https://github.com/Lans/multiple_dialog/blob/master/enframe_2019-06-28-15-36-44.png" width=200 height=350 />,
 <img src="https://github.com/Lans/multiple_dialog/blob/master/enframe_2019-06-28-15-36-49.png" width=200 height=350 />,
 <img src="https://github.com/Lans/multiple_dialog/blob/master/enframe_2019-06-28-15-36-52.png" width=200 height=350 />,

 


## Getting Started

    multiple_dialog: ^0.1.0
    
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

## 5. showCustomDialog
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
              
#### If you want to customize the Dialog, you can override showCustomDialog or showCustomAlertDialog

  A few resources to get you started if this is your first Flutter project:

  - [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
  - [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

  For help getting started with Flutter, view our
  [online documentation](https://flutter.dev/docs), which offers tutorials,
  samples, guidance on mobile development, and a full API reference.

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


