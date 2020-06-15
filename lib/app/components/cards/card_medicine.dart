import 'package:Clinicarx/app/models/MedicineModel.dart';
import 'package:Clinicarx/app/modules/home/medicines/medicine_screen.dart';
import 'package:flutter/material.dart';

class CardMedicine extends StatefulWidget {
  final MedicineModel medicine;
  CardMedicine(this.medicine);

  @override
  _CardMedicineState createState() => _CardMedicineState();
}

class _CardMedicineState extends State<CardMedicine> {
  String medicineDescription = 'Sem medicamentos';

  void initState() {
    super.initState();
    createMedicineDescription();
  }

  createMedicineDescription() {
    if (this.widget.medicine.medicines != null) {
      medicineDescription = this.widget.medicine.medicines;

      if (this.widget.medicine.activePrinciple != null) {
        medicineDescription +=
            ' (' + this.widget.medicine.activePrinciple + ')';
      } else {
        medicineDescription += ' (Sem princípio ativo)';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, MedicineScreen.tagRota,
              arguments: this.widget.medicine);
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
                    Text(
                      "INÍCIO: " +
                          (widget.medicine.treatmentStartDate != null
                              ? widget.medicine.treatmentStartDate
                              : "NÃO INFORMADO"),
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "FIM: " +
                          (widget.medicine.treatmentEndDate != null
                              ? widget.medicine.treatmentEndDate
                              : "NÃO INFORMADO"),
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 18),
                        child: Image(
                          width: 30,
                          image: AssetImage('assets/images/ICON_MEDICINE.png'),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              medicineDescription,
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
