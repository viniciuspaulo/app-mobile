import 'package:Clinicarx/app/components/cards/card_medicine.dart';
import 'package:Clinicarx/app/components/menu.dart';
import 'package:Clinicarx/app/models/MedicineModel.dart';
import 'package:Clinicarx/app/repositories/MedicineRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicinesScreen extends StatefulWidget {
  static String tagRota = '/home/medicines';
  static String tag = '/medicines';
  final Key menuKey;

  const MedicinesScreen({Key key, this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicamentPageState();
}

class _MedicamentPageState extends State<MedicinesScreen> {
  MedicinePaginate medicinePaginate = new MedicinePaginate();
  final repositorio = Modular.get<MedicineRepository>();
  List<MedicineModel> searchList = [];

  //Infity Scroll
  ScrollController _scrollController = new ScrollController();
  int page = 0;
  bool load = false;
  bool loadScroll = false;

  @override
  initState() {
    super.initState();
    onInit();

    _scrollController.addListener(() {
      var triggerFetchMoreSize =
          0.9 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        scrollLoad();
      }
    });
  }

  onInit() async {
    setState(() => load = true);
    searchList = [];
    medicinePaginate = await repositorio.getMedicine(page: page);
    searchList = medicinePaginate.data;
    setState(() => load = false);
  }

  scrollLoad() async {
    if (this.page >= medicinePaginate.total) {
      setState(() => loadScroll = false);
      return;
    }
    if (!loadScroll) {
      setState(() => loadScroll = true);
      searchList = [];
      MedicinePaginate result =
          await repositorio.getMedicine(page: this.page++);
      medicinePaginate.data = [...medicinePaginate.data, ...result.data];
      searchList = medicinePaginate.data;
      setState(() => loadScroll = false);
    }
  }

  search(String text) {
    medicinePaginate.data = searchList
        .where(
            (item) => item.medicines.toUpperCase().contains(text.toUpperCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image(
            width: 120,
            image: AssetImage(
              "assets/images/logo.png",
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
        ),
        drawer: Menu(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        labelText: 'Buscar medicamentos',
                        fillColor: Colors.black54,
                        focusColor: Colors.black54),
                    style: TextStyle(color: Colors.black54),
                    onChanged: search,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.search, color: Colors.black54),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: this.load
                    ? Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 1,
                      ))
                    : medicinePaginate.data.length > 0
                        ? ListView.builder(
                            controller: _scrollController,
                            itemCount: medicinePaginate.data.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              // if (loadScroll && index == attendancesPaginate.data.length) {
                              //   return Center(child: CircularProgressIndicator(
                              //     backgroundColor: Colors.white,
                              //     strokeWidth: 1,
                              //   ));
                              // }
                              return CardMedicine(medicinePaginate.data[index]);
                            },
                          )
                        : Center(
                            child: Text("Não existe atendimentos"),
                          ),
              ),
            )
          ],
        ));
  }
}
