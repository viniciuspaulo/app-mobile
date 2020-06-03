
import 'package:flutter/material.dart';



class SecundaryButton extends StatefulWidget {
 
  final String text;
  final GestureTapCallback onPressed;

  SecundaryButton({
    @required this.text,
    @required this.onPressed,
  });

  @override
  _SecundaryButton createState() => _SecundaryButton();
}

class _SecundaryButton extends State<SecundaryButton>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: OutlineButton(
        padding: EdgeInsets.all(16),
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(widget.text,
          style: TextStyle(
            color: Colors.teal
          ),
        )
      ),
    );
  }
}