import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/repositories/issue_report_repository.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

issueReportModal({
  @required context,
}) {
  String successMessage = 'Incidente reportado com sucesso!';
  bool loading = false;
  String issueComment;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final IssueReportRepository _issueReportRepository =
      new IssueReportRepository();

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
                child: Column(
                  children: [
                    Text(
                      'Reportar problema',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          maxLength: 1000,
                          decoration: InputDecoration(
                              hintText: "Descreva o que aconteceu...",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black54,
                                  width: 1.0,
                                ),
                              )),
                          onChanged: (String value) {
                            issueComment = value;
                          },
                          validator: (value) {
                            return value.isEmpty ? 'Campo obrigatório' : null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: PrimaryButton(
                        text: "Enviar",
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            setState(() => loading = true);

                            try {
                              await _issueReportRepository
                                  .sendIssueReport(issueComment);
                              setState(() => loading = false);
                              Navigator.pop(context);
                              Toast.show(successMessage, context);
                            } catch (error) {
                              Toast.show(
                                  'Ocorreu um erro ao reportar o problema',
                                  context);
                              setState(() => loading = false);
                            }
                          } else {
                            return null;
                          }
                        },
                        load: loading,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
