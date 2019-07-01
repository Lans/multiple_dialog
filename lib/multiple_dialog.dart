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

void showSimpleListDialog({
  bool barrierDismissible = true,
  @required BuildContext context,
  @required SimpleBuilder simpleBuilder,
  @required List<Widget> children,
  @required Function(int index) onItemCallBack,
}) {
  assert(context != null);
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return SimpleListDialog(
        children: children,
        simpleBuilder: simpleBuilder,
        onItemCallBack: onItemCallBack,
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

void showCustomDialog({
  @required BuildContext context,
  bool barrierDismissible = true,
  @required SimpleBuilder simpleBuilder,
  @required List<Widget> children,
}) {
  assert(context != null);
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CustomDialog(
        simpleBuilder: simpleBuilder,
        children: children,
      );
    },
  );
}

void showCustomAlertDialog({
  @required BuildContext context,
  bool barrierDismissible = true,
  @required DialogBuilder dialogBuilder,
  Widget confirmWidget,
  Widget cancelWidget,
  VoidCallback onConfirmCallBack,
  VoidCallback onCancelCallBack,
}) {
  assert(context != null);
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        dialogBuilder: dialogBuilder,
        confirmWidget: confirmWidget,
        cancelWidget: cancelWidget,
        onConfirmCallBack: onConfirmCallBack,
        onCancelCallBack: onCancelCallBack,
      );
    },
  );
}

class CustomAlertDialog extends StatelessWidget {
  final DialogBuilder dialogBuilder;

  final Widget confirmWidget;

  final Widget cancelWidget;

  final VoidCallback onConfirmCallBack;

  final VoidCallback onCancelCallBack;

  const CustomAlertDialog({
    Key key,
    this.confirmWidget,
    this.cancelWidget,
    @required this.dialogBuilder,
    this.onConfirmCallBack,
    this.onCancelCallBack,
  })  : assert(dialogBuilder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));

    return AlertDialog(
      title: dialogBuilder.simpleBuilder.title,
      titlePadding: dialogBuilder.simpleBuilder.contentPadding,
      titleTextStyle: dialogBuilder.titleTextStyle,
      content: SingleChildScrollView(
        child: dialogBuilder.simpleBuilder.content,
      ),
      contentPadding: dialogBuilder.simpleBuilder.contentPadding,
      contentTextStyle: dialogBuilder.contentTextStyle,
      backgroundColor: dialogBuilder.simpleBuilder.backgroundColor,
      elevation: dialogBuilder.simpleBuilder.elevation,
      semanticLabel: dialogBuilder.simpleBuilder.semanticLabel,
      shape: dialogBuilder.simpleBuilder.shape,
      actions: <Widget>[
        FlatButton(
          child: confirmWidget,
          onPressed: onConfirmCallBack,
        ),
        FlatButton(
          child: cancelWidget,
          onPressed: onCancelCallBack,
        ),
      ],
    );
  }
}

class CustomDialog extends StatelessWidget {
  final SimpleBuilder simpleBuilder;
  final List<Widget> children;

  const CustomDialog({
    Key key,
    @required this.simpleBuilder,
    @required this.children,
  })  : assert(simpleBuilder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return SimpleDialog(
      title: simpleBuilder.title,
      titlePadding: simpleBuilder.contentPadding,
      children: children,
      contentPadding: simpleBuilder.contentPadding,
      backgroundColor: simpleBuilder.backgroundColor,
      elevation: simpleBuilder.elevation,
      semanticLabel: simpleBuilder.semanticLabel,
      shape: simpleBuilder.shape,
    );
  }
}

class SimpleListDialog extends StatelessWidget {
  final List<Widget> children;

  final Function(int index) onItemCallBack;

  final SimpleBuilder simpleBuilder;

  const SimpleListDialog({
    Key key,
    @required this.children,
    @required this.onItemCallBack,
    this.simpleBuilder,
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

    return CustomDialog(
      simpleBuilder: simpleBuilder,
      children: body,
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

///Contains all AlertDialog attributes
class DialogBuilder {
  /// Style for the text in the [title] of this [AlertDialog].
  ///
  /// If null, [DialogTheme.titleTextStyle] is used, if that's null, defaults to
  /// [ThemeData.textTheme.title].
  final TextStyle titleTextStyle;

  /// Style for the text in the [content] of this [AlertDialog].
  ///
  /// If null, [DialogTheme.contentTextStyle] is used, if that's null, defaults
  /// to [ThemeData.textTheme.subhead].
  final TextStyle contentTextStyle;

  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog.
  ///
  /// Typically this is a list of [FlatButton] widgets.
  ///
  /// These widgets will be wrapped in a [ButtonBar], which introduces 8 pixels
  /// of padding on each side.
  ///
  /// If the [title] is not null but the [content] _is_ null, then an extra 20
  /// pixels of padding is added above the [ButtonBar] to separate the [title]
  /// from the [actions].
  final List<Widget> actions;

  final SimpleBuilder simpleBuilder;

  const DialogBuilder({
    Key key,
    this.titleTextStyle,
    this.simpleBuilder,
    this.contentTextStyle,
    this.actions,
  });
}

class SimpleBuilder {
  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Padding around the title.
  ///
  /// If there is no title, no padding will be provided. Otherwise, this padding
  /// is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the title. If the [content] is not null, then no bottom padding is
  /// provided (but see [contentPadding]). If it _is_ null, then an extra 20
  /// pixels of bottom padding is added to separate the [title] from the
  /// [actions].
  final EdgeInsetsGeometry titlePadding;

  /// The (optional) content of the dialog is displayed in the center of the
  /// dialog in a lighter font.
  ///
  /// Typically this is a [SingleChildScrollView] that contains the dialog's
  /// message. As noted in the [AlertDialog] documentation, it's important
  /// to use a [SingleChildScrollView] if there's any risk that the content
  /// will not fit.
  final Widget content;

  /// Padding around the content.
  ///
  /// If there is no content, no padding will be provided. Otherwise, padding of
  /// 20 pixels is provided above the content to separate the content from the
  /// title, and padding of 24 pixels is provided on the left, right, and bottom
  /// to separate the content from the other edges of the dialog.
  final EdgeInsetsGeometry contentPadding;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color backgroundColor;

  /// {@macro flutter.material.dialog.elevation}
  /// {@macro flutter.material.material.elevation}
  final double elevation;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// If this label is not provided, a semantic label will be inferred from the
  /// [title] if it is not null.  If there is no title, the label will be taken
  /// from [MaterialLocalizations.alertDialogLabel].
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.isRouteName], for a description of how this
  ///    value is used.
  final String semanticLabel;

  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder shape;

  const SimpleBuilder(
      {Key key,
      this.title,
      this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      this.content,
      this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      this.backgroundColor,
      this.shape,
      this.elevation,
      this.semanticLabel});
}
