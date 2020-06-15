import 'package:flutter/material.dart';

class PrimaryInput extends StatefulWidget {
  final String initialValue;
  final String labelText;
  final Function onChanged;
  final Function onSaved;
  final Color color;
  final bool enable;
  final TextEditingController mask;
  final TextInputType keyboardType;
  final IconButton suffixIcon;
  final Function validator;
  final bool obscureText;

  const PrimaryInput({
    @required this.labelText,
    @required this.onChanged,
    @required this.onSaved,
    this.initialValue,
    this.keyboardType,
    this.mask,
    this.color,
    this.enable = true,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
  });

  @override
  _PrimaryInput createState() => _PrimaryInput();
}

class _PrimaryInput extends State<PrimaryInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enable,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      controller: widget.mask,
      decoration: InputDecoration(
        hintText: widget.labelText,
        filled: !widget.enable,
        suffixIcon: widget.suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[700], width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[700], width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 1.0),
        ),
      ),
      onChanged: widget.onChanged,
      onSaved: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.obscureText,
    );
  }
}
