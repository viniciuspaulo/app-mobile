import 'package:flutter/material.dart';

class SocialButton extends StatefulWidget {
  final Icon icon;
  final Image image;
  final GestureTapCallback onPressed;
  final bool load;

  SocialButton({this.icon, this.image, @required this.onPressed, this.load});

  @override
  _SocialButton createState() => _SocialButton();
}

class _SocialButton extends State<SocialButton> {
  verifyIconChild() {
    if (widget.icon != null) {
      return widget.icon;
    } else {
      if (widget.image != null) {
        return widget.image;
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: widget.load
          ? CircularProgressIndicator(
              strokeWidth: 1,
            )
          : Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: verifyIconChild(),
            ),
    );
  }
}
