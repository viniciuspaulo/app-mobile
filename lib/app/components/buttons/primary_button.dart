import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    @required this.text,
    @required this.onPressed,
    this.load,
  });

  final String text;
  final GestureTapCallback onPressed;
  final bool load;

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
        onPressed: widget.onPressed,
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
