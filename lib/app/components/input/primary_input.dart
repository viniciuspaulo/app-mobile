
import 'package:flutter/material.dart';

class PrimaryInput extends StatefulWidget {
  const PrimaryInput({
    this.initialValue,
    @required this.labelText,
    @required this.onChanged,
    @required this.onSaved,
    this.color,
    this.enable,
  });


  final String initialValue;
  final String labelText;
  final Function onChanged;
  final Function onSaved;
  final Color color;
  final bool enable;

  @override
  _PrimaryInput createState() => _PrimaryInput();
}

class _PrimaryInput extends State<PrimaryInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enable == null && widget.enable != false,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black54, width: 1.0),
        ),
      ),
      onChanged: widget.onChanged,
      onSaved: widget.onChanged,
    );
  }
}
