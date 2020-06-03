




import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Connect extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Icon(Icons.signal_wifi_off,
                color: Colors.teal,
                size: 100,
              )
          ),
          Text("Ops você está sem conexão",
            style: TextStyle(
              fontSize: 25
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              width: 100,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ]),
      ),
    );
  }

}