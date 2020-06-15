import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final GestureTapCallback onPressed;
  final bool disabled;
  final bool load;

  SecondaryButton({
    @required this.text,
    @required this.onPressed,
    this.disabled = false,
    this.load = false,
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
        onPressed: widget.disabled ? null : widget.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: widget.load
            ? SizedBox(
                width: 17,
                height: 17,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 1,
                ),
              )
            : Text(
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
