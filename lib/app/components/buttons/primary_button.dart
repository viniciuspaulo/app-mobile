import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final GestureTapCallback onPressed;
  final bool disabled;
  final bool load;

  const PrimaryButton({
    @required this.text,
    @required this.onPressed,
    this.disabled = false,
    this.load = false,
  });

  @override
  _PrimaryButton createState() => _PrimaryButton();
}

class _PrimaryButton extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        padding: const EdgeInsets.all(16),
        color: Colors.teal,
        disabledColor: Colors.teal[300],
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
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
