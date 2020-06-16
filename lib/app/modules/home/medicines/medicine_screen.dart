import 'package:Clinicarx/app/models/MedicineModel.dart';
import 'package:flutter/material.dart';

class MedicineScreen extends StatefulWidget {
  static String tagRota = '/home/medicine';
  static String tag = '/medicine';
  final Key menuKey;

  const MedicineScreen({Key key, this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  MedicineModel medicine = new MedicineModel();

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      medicine = ModalRoute.of(context).settings.arguments;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Image(
            width: 100,
            image: AssetImage(
              "assets/images/logo@2x.png",
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    width: screenSize.width,
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Visibility(
                                visible: medicine.continuous != null &&
                                    medicine.continuous,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.teal,
                                  child: Text(
                                    "USO CONTINUO",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            width: 50,
                            image:
                                AssetImage('assets/images/ICON_MEDICINE.png'),
                          ),
                        ),
                        Text(
                          (medicine.medicines != null
                                  ? medicine.medicines
                                  : "Sem medicamentos") +
                              (medicine.activePrinciple != null
                                  ? "(" + medicine.activePrinciple + ")"
                                  : "Sem princípios ativos"),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            medicine.laboratory != null &&
                                    medicine.laboratory != ""
                                ? medicine.laboratory
                                : "Sem laboratório",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Prescritor:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                medicine.prescriptive != null &&
                                        medicine.prescriptive != ""
                                    ? medicine.prescriptive
                                    : "Sem prescritor",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ]),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: medicine != null
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "INÍCIO: " +
                                          (medicine.treatmentStartDate != null
                                              ? medicine.treatmentStartDate
                                              : "NÃO INFORMADO"),
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "FIM: " +
                                          (medicine.treatmentEndDate != null
                                              ? medicine.treatmentEndDate
                                              : "NÃO INFORMADO"),
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                        ),
                        Divider(),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.teal,
                          child: Center(
                            child: Text(
                              "Conforme instruções adicionais",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
