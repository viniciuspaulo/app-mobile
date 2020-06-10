import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchInput extends StatefulWidget {
  final String initialValue;
  final String hintText;
  final Function onChanged;
  final Function onSaved;
  final bool disabled;

  const SearchInput({
    this.initialValue,
    this.hintText = 'Buscar',
    this.disabled = false,
    @required this.onChanged,
    @required this.onSaved,
  });

  @override
  _SearchInput createState() => _SearchInput();
}

class _SearchInput extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: TextFormField(
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(left: 8, top: 15),
          fillColor: Colors.black54,
          focusColor: Colors.black54,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: Icon(
            FontAwesomeIcons.search,
            color: Colors.black54,
            size: 16,
          ),
        ),
        style: TextStyle(color: Colors.black54, fontSize: 14),
        onChanged: widget.onChanged,
      ),
    );
  }
}
