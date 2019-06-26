library multiple_dialog;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//扩展AlertDialog
void showAlertDialog({
  Widget title,
  EdgeInsetsGeometry titlePadding,
  TextStyle titleTextStyle,
  Widget content,
  TextStyle contentTextStyle,
  List<Widget> actions,
  Color backgroundColor,
  double elevation,
  String semanticLabel,
  ShapeBorder shape,
  bool barrierDismissible = true,
  @required BuildContext context,
}) {
  assert(context != null);
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        titlePadding: titlePadding,
        titleTextStyle: titleTextStyle,
        content: content,
        contentTextStyle: contentTextStyle,
        backgroundColor: backgroundColor,
        elevation: elevation,
        semanticLabel: semanticLabel,
        shape: shape,
        actions: actions,
      );
    },
  );
}

//带列表的AlertDialog
void showListDialog<T>({
  Widget title,
  bool barrierDismissible = false,
  @required BuildContext context,
  @required List<Widget> children,
  @required VoidCallback onConfirmCallBack,
  @required VoidCallback onCancelCallBack,
  @required Function(int index) onItemCallBack,
}) {
  assert(context != null);
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return ListDialog<T>(
        title: title,
        children: children,
        onConfirmCallBack: onConfirmCallBack,
        onCancelCallBack: onCancelCallBack,
        onItemCallBack: onItemCallBack,
      );
    },
  );
}

void showBottomDialog({
  Widget title,
  EdgeInsetsGeometry titlePadding,
  TextStyle titleTextStyle,
  Widget content,
  TextStyle contentTextStyle,
  List<Widget> actions,
  Color backgroundColor,
  double elevation,
  String semanticLabel,
  ShapeBorder shape,
  bool barrierDismissible = true,
  @required BuildContext context,
}) {
  assert(context != null);
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return BottomDialog(
        title: title,
        titlePadding: titlePadding,
        titleTextStyle: titleTextStyle,
        content: content,
        contentTextStyle: contentTextStyle,
        shape: shape,
        actions: actions,
      );
    },
  );
}

//loadingDialog
void showLoadingDialog({
  BuildContext context,
  String message = "加载中...",
  double height = 120,
  double width = 120,
  ShapeBorder shape,
  Direction direction = Direction.Vertical,
  bool barrierDismissible = true,
}) {
  assert(context != null);
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return LoadingDialog(
        message: message,
        height: height,
        width: width,
        shape: shape,
        direction: direction,
      );
    },
  );
}

class ListDialog<T> extends StatelessWidget {
  //底部按钮
  final List<Widget> actions;

  final List<Widget> children;

  final VoidCallback onConfirmCallBack;

  final VoidCallback onCancelCallBack;

  final Function(int index) onItemCallBack;

  final Widget title;

  const ListDialog({
    Key key,
    @required this.children,
    @required this.onConfirmCallBack,
    @required this.onCancelCallBack,
    @required this.onItemCallBack,
    this.actions,
    this.title,
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    List<Widget> body = <Widget>[];
    if (children != null) {
      for (var index = 0; index < children.length; index++) {
        body.add(InkWell(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: children[index],
          ),
          onTap: () {
            onItemCallBack(index);
          },
        ));
      }
    }

    return AlertDialog(
      title: title,
      content: SingleChildScrollView(
        child: ListBody(
          children: body,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("确认"),
          onPressed: onConfirmCallBack,
        ),
        FlatButton(
          child: Text("取消"),
          onPressed: onCancelCallBack,
        ),
      ],
    );
  }
}

//底部弹出AlertDialog
class BottomDialog extends StatelessWidget {
  final Widget title;

  final EdgeInsetsGeometry titlePadding;

  final TextStyle titleTextStyle;

  final Widget content;

  final EdgeInsetsGeometry contentPadding;

  final TextStyle contentTextStyle;

  final List<Widget> actions;

  final Color backgroundColor;

  final double elevation;

  //描述
  final String semanticLabel;

  final ShapeBorder shape;

  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)));
  static const double _defaultElevation = 24.0;

  const BottomDialog({
    Key key,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final List<Widget> children = <Widget>[];
    String label = semanticLabel;

    if (title != null) {
      children.add(Padding(
        padding: titlePadding ??
            EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0),
        child: DefaultTextStyle(
          style: titleTextStyle ??
              dialogTheme.titleTextStyle ??
              theme.textTheme.title,
          child: Semantics(
            child: title,
            namesRoute: true,
            container: true,
          ),
        ),
      ));
    }

    if (content != null) {
      children.add(Flexible(
        child: Padding(
          padding: contentPadding,
          child: DefaultTextStyle(
            style: contentTextStyle ??
                dialogTheme.contentTextStyle ??
                theme.textTheme.subhead,
            child: content,
          ),
        ),
      ));
    }
    if (actions != null) {
      children.add(ButtonTheme.bar(
        child: ButtonBar(
          children: actions,
        ),
      ));
    }

    Widget dialogChild = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    if (label != null)
      dialogChild = Semantics(
        namesRoute: true,
        label: label,
        child: dialogChild,
      );

    return Container(
      alignment: Alignment.bottomCenter,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: 50,
              maxHeight: MediaQuery.of(context).size.height),
          child: Material(
            color: backgroundColor ??
                dialogTheme.backgroundColor ??
                Theme.of(context).dialogBackgroundColor,
            shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
            elevation: elevation ?? dialogTheme.elevation ?? _defaultElevation,
            child: dialogChild,
          ),
        ),
      ),
    );
  }
}

//加载框
class LoadingDialog extends Dialog {
  const LoadingDialog({
    Key key,
    this.width,
    this.height,
    this.message,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.messageStyle,
    this.direction,
  }) : super(key: key);

  final String message;
  final TextStyle messageStyle;
  final Color backgroundColor;
  final double elevation;
  final ShapeBorder shape;
  final double height;
  final double width;
  final Direction direction;

  static const double _defaultElevation = 24.0;
  static const RoundedRectangleBorder _defaultDialogShape =
  RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)));

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: Material(
            color: backgroundColor ??
                dialogTheme.backgroundColor ??
                Theme.of(context).dialogBackgroundColor,
            elevation: elevation ?? dialogTheme.elevation ?? _defaultElevation,
            shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
            type: MaterialType.card,
            child: SafeArea(
              child: SizedBox(
                height: width,
                width: height,
                child: Container(
                  child: changeDirection(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget changeDirection() {
    if (direction == Direction.Vertical) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              message,
              style: messageStyle,
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              message,
              style: messageStyle,
            ),
          ),
        ],
      );
    }
  }
}

enum Direction { Vertical, Horizontal }
