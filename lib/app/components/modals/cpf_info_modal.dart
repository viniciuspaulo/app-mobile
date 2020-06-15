import 'package:Clinicarx/app/components/buttons/secondary_button.dart';
import 'package:flutter/material.dart';

cpfInfoModal({
  @required context,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.black45,
                        size: 65,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Por que pedimos o seu CPF?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Text(
                          'Precisamos do seu CPF para localizar seu cadastro no Clinicarx e garantir que seu acesso seja realizado de forma segura.',
                          style: TextStyle(color: Colors.black45, height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        child: SecondaryButton(
                          text: 'ok, entendi',
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
