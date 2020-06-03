

import 'package:flutter/material.dart';

class MedicamentScreen extends StatefulWidget {
  static String tagRota = '/home/medicament';
  static String tag = '/medicament';
  final Key menuKey;

  const MedicamentScreen({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicamentScreenState();
}

class _MedicamentScreenState extends State<MedicamentScreen> {
  
    
  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: Image(
          width: 120,
          image: AssetImage("assets/images/logo.png",),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
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
                          Container(
                            padding: const EdgeInsets.all(5),
                            color: Colors.teal,
                            child: Text("USO CONTINUO",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          )
                      ]),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          width: 50,
                          image: AssetImage('assets/images/ICON_MEDICINE.png'),
                        ),
                      ),
                      Text("Puran T4 (Levotiroxina)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Puran T4 (Levotiroxina)",
                          style: TextStyle(
                            color: Colors.black54
                          ),
                        ),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("Prescritor:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                          ),
                        ),
                        Text("Sem prescritor",
                          style: TextStyle(
                            color: Colors.black54
                          ),
                        ),
                      ]),

                      Divider(),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("INICIO: NÃO INFORMADO FIM: NÃO INFORMADO",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                          ),
                        ),
                      ),

                      Divider(),

                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.teal,
                        child: Center(
                          child: Text("Conforme instruções adicionais",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),
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
      )
    );
  }

}
