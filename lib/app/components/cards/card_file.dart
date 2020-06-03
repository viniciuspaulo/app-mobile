

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardFile extends StatelessWidget {

  CardFile();
  
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(FontAwesomeIcons.file),
        title: Text("Arquivo anexado"),
      ),
    );
  }
}