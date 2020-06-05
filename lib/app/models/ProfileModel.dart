import 'package:Clinicarx/app/models/ResponsiblesModel.dart';

class ProfileModel {
  String id;
  String name;
  String birthday;
  String email;
  String sex;
  String document;
  Null occupation;
  Null birthCity;
  Null birthState;
  Null birthCountry;
  Null motherName;
  Null skinColor;
  bool newsletter;
  int amountAttendances;
  int amountMedicines;
  List<LastClinicAttendances> lastClinicAttendances;
  List<dynamic> phones;
  List<ResponsiblesModel> responsibles;

  String googleToken;
  String facebookToken;
  String appleToken;

  ProfileModel(
      {this.id,
      this.name,
      this.birthday,
      this.email,
      this.sex,
      this.document,
      this.occupation,
      this.birthCity,
      this.birthState,
      this.birthCountry,
      this.motherName,
      this.skinColor,
      this.newsletter,
      this.amountAttendances,
      this.amountMedicines,
      this.lastClinicAttendances,
      this.googleToken,
      this.facebookToken,
      this.appleToken,
      this.responsibles});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birthday = json['birthday'];
    email = json['email'];
    sex = json['sex'];
    document = json['document'];
    occupation = json['occupation'];
    birthCity = json['birth_city'];
    birthState = json['birth_state'];
    birthCountry = json['birth_country'];
    motherName = json['mother_name'];
    skinColor = json['skin_color'];
    newsletter = json['newsletter'];


    googleToken = json['google_token'];
    facebookToken = json['facebook_token'];
    appleToken = json['apple_token'];

    amountAttendances = json['amountAttendances'];
    amountMedicines = json['amountMedicines'];
    if (json['lastClinicAttendances'] != null) {
      lastClinicAttendances = new List<LastClinicAttendances>();
      json['lastClinicAttendances'].forEach((v) {
        lastClinicAttendances.add(new LastClinicAttendances.fromJson(v));
      });
    }
    if (json['phones'] != null) {
      // phones = new List<Null>();
      // json['phones'].forEach((v) {
      //   phones.add(new Null.fromJson(v));
      // });
    }
    if (json['responsibles'] != null) {
      responsibles = new List<ResponsiblesModel>();
      json['responsibles'].forEach((v) {
        responsibles.add(new ResponsiblesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['email'] = this.email;
    data['sex'] = this.sex;
    data['document'] = this.document;
    data['occupation'] = this.occupation;
    data['birth_city'] = this.birthCity;
    data['birth_state'] = this.birthState;
    data['birth_country'] = this.birthCountry;
    data['mother_name'] = this.motherName;
    data['skin_color'] = this.skinColor;
    data['newsletter'] = this.newsletter;


    data['google_token'] = this.googleToken;
    data['facebook_token'] = this.facebookToken;
    data['apple_token'] = this.appleToken;

    data['amountAttendances'] = this.amountAttendances;
    data['amountMedicines'] = this.amountMedicines;
    if (this.lastClinicAttendances != null) {
      data['lastClinicAttendances'] =
          this.lastClinicAttendances.map((v) => v.toJson()).toList();
    }
    if (this.phones != null) {
      data['phones'] = this.phones.map((v) => v.toJson()).toList();
    }
    if (this.responsibles != null) {
      data['responsibles'] = this.responsibles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LastClinicAttendances {
  String id;
  String name;
  String logo;
  String phone;
  String logoName;

  LastClinicAttendances(
      {this.id, this.name, this.logo, this.phone, this.logoName});

  LastClinicAttendances.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    phone = json['phone'];
    logoName = json['logo_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['phone'] = this.phone;
    data['logo_name'] = this.logoName;
    return data;
  }
}
