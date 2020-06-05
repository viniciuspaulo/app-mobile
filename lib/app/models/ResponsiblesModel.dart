class ResponsiblesModel {
  String name;
  String email;
  String phone1;

  ResponsiblesModel({this.name, this.email, this.phone1});

  ResponsiblesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone1 = json['phone1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone1'] = this.phone1;
    return data;
  }
}
