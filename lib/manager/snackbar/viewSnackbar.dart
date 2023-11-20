import 'package:flutter/material.dart';

class ViewSnackBar {
  final BuildContext context;
  final String text;
  final Color backgroundColor;
  final Color closeIconColor;
  bool? showCloseIcon;
  ViewSnackBar(
    this.context, {
    required this.text,
    this.backgroundColor = Colors.green,
    this.showCloseIcon = true,
    this.closeIconColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    var snackBar = SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      showCloseIcon: showCloseIcon,
      closeIconColor: closeIconColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
