import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();

  final scaffKey = GlobalKey<ScaffoldState>();

  void showSnackBar(SnackBar snackbar) {
    scaffKey.currentState.showSnackBar(snackbar);
  }

  void showSnackBarPrimary(String message) {
    final snackbar = SnackBar(
      backgroundColor: Colors.teal,
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    scaffKey.currentState.showSnackBar(snackbar);
  }

  void showSnackBarDanger(String message) {
    final snackbar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    scaffKey.currentState.showSnackBar(snackbar);
  }
}
