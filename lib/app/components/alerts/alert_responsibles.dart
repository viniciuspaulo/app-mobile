import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/input/primary_input.dart';
import 'package:Clinicarx/app/models/ResponsiblesModel.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

modalAlertResponsibles({@required context, @required Function onPress}) {
  ResponsiblesModel responsible = new ResponsiblesModel();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    ),
    builder: (BuildContext context) {
      final Size screenSize = MediaQuery.of(context).size;

      return Container(
        width: screenSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Inclua contatos de emergência",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Dê preferência ao contato via telefone"),
                ),
                Divider(color: Colors.transparent),
                PrimaryInput(
                    initialValue: responsible.email,
                    labelText: 'Nome *',
                    onChanged: (String value) {
                      responsible.name = value;
                    },
                    onSaved: (String value) {
                      responsible.name = value;
                    }),
                Divider(color: Colors.transparent),
                PrimaryInput(
                    initialValue: responsible.email,
                    labelText: 'Email *',
                    onChanged: (String value) {
                      responsible.email = value;
                    },
                    onSaved: (String value) {
                      responsible.email = value;
                    }),
                Divider(color: Colors.transparent),
                PrimaryInput(
                    initialValue: responsible.email,
                    labelText: 'Telefone *',
                    onChanged: (String value) {
                      responsible.phone1 = value;
                    },
                    onSaved: (String value) {
                      responsible.phone1 = value;
                    }),
                Divider(color: Colors.transparent),
                PrimaryButton(
                    text: "ADICIONAR",
                    load: false,
                    onPressed: () {
                      if ((responsible.name == null ||
                              responsible.name == "") ||
                          (responsible.email == null ||
                              responsible.email == "") ||
                          (responsible.phone1 == null ||
                              responsible.phone1 == "")) {
                        Toast.show("Complete os dados corretamente.", context);
                        return;
                      }
                      Navigator.pop(context);
                      onPress(responsible);
                    }),
                Divider(color: Colors.transparent)
              ],
            ),
          ),
        ),
      );
    },
  );
}
