

import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:flutter/material.dart';

class CardProcedure extends StatelessWidget {

  final Procedures procedure;
  CardProcedure(this.procedure);

  
  
  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Visibility(
            visible: procedure.pAD != null && procedure.pAS != null,
            child: ListTile(
              title: Text("Pressão arterial (média)",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                )
              ),
              subtitle: Text(procedure.pAD <= 0 && procedure.pAS <= 0 ?  "NÃO INFORMADO" : "${procedure.pAD} x ${procedure.pAS} mmhg")
            ),
          ),
          Visibility(
            visible: procedure.freqCardiaca != null,
            child: ListTile(
              title: Text("Frequência cardíaca",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                )
              ),
              subtitle: Text(procedure.freqCardiaca != null && procedure.freqCardiaca > 0 ? "${procedure.freqCardiaca} BPM" : "NÃO INFORMADO")
            ),
          ),
          Visibility(
            visible: procedure.average != null,
            child: ListTile(
              title: Text("Glicemia (média)",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                )
              ),
              subtitle: Text(procedure.average != null && procedure.average > 0 ? "${procedure.average} mg/dL" : "NÃO INFORMADO")
            ),
          ),
          Visibility(
            visible: procedure.foodStatus != null,
            child: ListTile(
              title: Text("Estado alimentar",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                )
              ),
              subtitle: Text(procedure.foodStatus != null ? procedure.foodStatus  : "NÃO INFORMADO")
            ),
          ),
          Visibility(
            visible: procedure.hasDiabetes != null,
            child: ListTile(
              title: Text("Diagnóstico prévio de diabetes",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                )
              ),
              subtitle: Text(procedure.hasDiabetes != null && procedure.hasDiabetes ? "SIM"  : "NÃO INFORMADO")
            ),
          )
        ],
      ),
    );
  }
}