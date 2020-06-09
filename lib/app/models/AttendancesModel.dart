class AttendancesModel {
  String id;
  String patientId;
  String farmaceutico = "";
  String farmaceuticoCargo;
  String createdTime;
  String closedTime;
  String farmaciaName = "";
  String farmaciaPhone;
  String farmaciaIdentificacao;
  String description;
  String duration;
  int rating;
  String logo;
  String logoName;
  List<AttendancesFilesModel> files = [];
  List<Procedures> procedures = [];

  AttendancesModel(
      {this.id,
      this.patientId,
      this.farmaceutico,
      this.farmaceuticoCargo,
      this.createdTime,
      this.closedTime,
      this.farmaciaName,
      this.farmaciaPhone,
      this.farmaciaIdentificacao,
      this.description,
      this.duration,
      this.rating,
      this.logo,
      this.logoName,
      this.files,
      this.procedures});

  AttendancesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    farmaceutico = json['farmaceutico'];
    farmaceuticoCargo = json['farmaceutico_cargo'];
    createdTime = json['created_time'];
    closedTime = json['closed_time'];
    farmaciaName = json['farmacia_name'];
    farmaciaPhone = json['farmacia_phone'];
    farmaciaIdentificacao = json['farmacia_identificacao'];
    description = json['description'];
    duration = json['duration'];
    rating = json['rating'];
    logo = json['logo'];
    logoName = json['logo_name'];
    if (json['files'] != null) {
      files = new List<AttendancesFilesModel>();
      json['files'].forEach((v) {
        files.add(new AttendancesFilesModel.fromJson(v));
      });
    }
    if (json['procedures'] != null) {
      procedures = new List<Procedures>();
      json['procedures'].forEach((v) {
        procedures.add(new Procedures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['farmaceutico'] = this.farmaceutico;
    data['farmaceutico_cargo'] = this.farmaceuticoCargo;
    data['created_time'] = this.createdTime;
    data['closed_time'] = this.closedTime;
    data['farmacia_name'] = this.farmaciaName;
    data['farmacia_phone'] = this.farmaciaPhone;
    data['farmacia_identificacao'] = this.farmaciaIdentificacao;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['rating'] = this.rating;
    data['logo'] = this.logo;
    data['logo_name'] = this.logoName;
    if (this.files != null) {
      data['files'] = this.files.map((v) => v.toJson()).toList();
    }
    data['procedures'] = this.procedures;
    return data;
  }

  static List<AttendancesModel> encondeToJson(List<dynamic> itens) {
    List<AttendancesModel> list = [];
    for (int i = 0; i < itens.length; i++) {
      list.add(AttendancesModel.fromJson(itens[i]));
    }
    return list;
  }
}

class AttendancesFilesModel {
  String id;
  String category;
  String name;

  AttendancesFilesModel({this.id, this.category, this.name});

  AttendancesFilesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['name'] = this.name;
    return data;
  }
}

class Procedures {
  String id;
  bool hasDiabetes;
  String foodStatus = "";
  String orientation = "";
  int average;
  String type = "";
  String consideration = "";
  dynamic regua;

  int pAS;
  int pAD;
  int freqCardiaca;
  bool hasHypertension;

  Procedures(
      {this.id,
      this.hasDiabetes,
      this.foodStatus,
      this.orientation,
      this.average,
      this.type,
      this.pAS,
      this.pAD,
      this.freqCardiaca,
      this.hasHypertension,
      this.consideration,
      this.regua});

  Procedures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hasDiabetes = json['has_diabetes'];
    foodStatus = json['food_status'];
    orientation = json['orientation'];
    average = json['average'];
    type = json['type'];
    consideration = json['consideration'];
    regua = json['regua'];

    pAS = json['PAS'];
    pAD = json['PAD'];
    freqCardiaca = json['freq_cardiaca'];
    hasHypertension = json['has_hypertension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['has_diabetes'] = this.hasDiabetes;
    data['food_status'] = this.foodStatus;
    data['orientation'] = this.orientation;
    data['average'] = this.average;
    data['type'] = this.type;
    data['consideration'] = this.consideration;
    if (this.regua != null) {
      data['regua'] = this.regua.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
