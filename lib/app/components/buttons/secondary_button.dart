import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final GestureTapCallback onPressed;

  SecondaryButton({
    @required this.text,
    @required this.onPressed,
  });

  @override
  _SecondaryButton createState() => _SecondaryButton();
}

class _SecondaryButton extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.black26),
        padding: EdgeInsets.all(16),
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          widget.text.toUpperCase(),
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
