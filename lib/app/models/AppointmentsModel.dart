class AppointmentsModel {
  String id;
  String scheduledStartAt;
  String scheduledEndAt;
  String name;
  String phone;
  String logo;
  String logoName;

  AppointmentsModel(
      {this.id,
      this.scheduledStartAt,
      this.scheduledEndAt,
      this.name,
      this.phone,
      this.logo,
      this.logoName});

  AppointmentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduledStartAt = json['scheduled_start_at'];
    scheduledEndAt = json['scheduled_end_at'];
    name = json['name'];
    phone = json['phone'];
    logo = json['logo'];
    logoName = json['logo_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheduled_start_at'] = this.scheduledStartAt;
    data['scheduled_end_at'] = this.scheduledEndAt;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['logo'] = this.logo;
    data['logo_name'] = this.logoName;
    return data;
  }

  static List<AppointmentsModel> encondeToJson(List<dynamic> itens) {
    List<AppointmentsModel> list = [];
    for (int i = 0; i < itens.length; i++) {
      list.add(AppointmentsModel.fromJson(itens[i]));
    }
    return list;
  }
}
