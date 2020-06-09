class PhoneModel {
  String type;
  String phone;

  PhoneModel({this.type, this.phone});

  PhoneModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['phone'] = this.phone;
    return data;
  }
}
