

import 'package:Clinicarx/app/modules/home/medicament/medicament_screen.dart';
import 'package:flutter/material.dart';

class CardMedicament extends StatelessWidget {

  CardMedicament();
  
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MedicamentScreen.tagRota);
      },
      child: Card(
        margin: const EdgeInsets.all(15.0),
        elevation: 5,
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
                  Image(
                    width: 30,
                    image: AssetImage('assets/images/ICON_MEDICINE.png'),
                  ),
                  Text("Puran T4 (Levotiroxina)"),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.teal,
              child: Center(
                child: Text("Conforme instruções adicionais",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}