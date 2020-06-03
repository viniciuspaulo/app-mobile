

import 'package:flutter/material.dart';

class CardProcedure extends StatelessWidget {

  CardProcedure();
  
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("INÍCIO: NÃO INFORMADO"),
                Text("FIM: NÃO INFORMADO"),
              ],
            ),
          ),
          Divider(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("INÍCIO: NÃO INFORMADO"),
                    Text("FIM: NÃO INFORMADO"),
                  ],
                ),
                Column(
                  children: [
                    Text("INÍCIO: NÃO INFORMADO"),
                    Text("FIM: NÃO INFORMADO"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}