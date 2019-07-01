import 'package:flutter/material.dart';

void showBottomDialog({
  @required BuildContext context,
  Widget title,
  EdgeInsetsGeometry titlePadding,
  EdgeInsetsGeometry contentPadding =
      const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
  TextStyle titleTextStyle,
  Widget content,
  TextStyle contentTextStyle,
  List<Widget> actions,
  Color backgroundColor,
  double elevation,
  String semanticLabel,
  ShapeBorder shape,
  bool isScrollControlled = false,
}) {
  assert(context != null);
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return BottomDialog(
        title: title,
        titleTextStyle: titleTextStyle,
        titlePadding: titlePadding,
        content: content,
        contentTextStyle: contentTextStyle,
        contentPadding: contentPadding,
        semanticLabel: semanticLabel,
        actions: actions,
      );
    },
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    isScrollControlled: isScrollControlled,
  );
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

  //描述
  final String semanticLabel;

  const BottomDialog({
    Key key,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.actions,
    this.semanticLabel,
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

    return dialogChild;
  }
}
