import 'package:flutter/material.dart';

snackBarCustom({
  @required GlobalKey<ScaffoldState> scaffoldKey,
  @required String title,
  Function onPress,
  String onPressTitle,
  MaterialColor color,
  Color colorText,
}) {
  final snackBar = SnackBar(
      content: Text(title),
      backgroundColor: color != null ? color : Colors.teal,
      action: SnackBarAction(
        textColor: colorText != null ? colorText : Colors.teal,
        label: onPressTitle != null ? onPressTitle : 'Ok',
        onPressed: onPress != null ? onPress : () {},
      ));

  scaffoldKey.currentState.showSnackBar(snackBar);
}
