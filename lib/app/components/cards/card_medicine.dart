import 'package:Clinicarx/app/models/MedicineModel.dart';
import 'package:Clinicarx/app/modules/home/medicines/medicine_screen.dart';
import 'package:flutter/material.dart';

class CardMedicine extends StatelessWidget {
  final MedicineModel medicine;
  CardMedicine(this.medicine);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, MedicineScreen.tagRota,
              arguments: this.medicine);
        },
        child: Card(
          margin: const EdgeInsets.all(5.0),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("INÍCIO: " +
                        (medicine.treatmentStartDate != null
                            ? medicine.treatmentStartDate
                            : "NÃO INFORMADO")),
                    Text("FIM: " +
                        (medicine.treatmentEndDate != null
                            ? medicine.treatmentEndDate
                            : "NÃO INFORMADO")),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image(
                      width: 30,
                      image: AssetImage('assets/images/ICON_MEDICINE.png'),
                    ),
                    Text(medicine.medicines != null
                        ? medicine.medicines
                        : "Sem medicamentos"),
                    Text(medicine.activePrinciple != null
                        ? "(" + medicine.activePrinciple + ")"
                        : "Sem princípios ativos"),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.teal,
                child: Center(
                  child: Text(
                    "Conforme instruções adicionais",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
