
import 'package:flutter/material.dart';



class SocialButton extends StatefulWidget {
 
  final Icon icon;
  final GestureTapCallback onPressed;
  final bool load;

  SocialButton({
    @required this.icon,
    @required this.onPressed,
    this.load
  });

  @override
  _SocialButton createState() => _SocialButton();
}

class _SocialButton extends State<SocialButton>{

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: widget.load ? CircularProgressIndicator(
        strokeWidth: 1,
      ) : Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: widget.icon,
      ),
    );
  }
}