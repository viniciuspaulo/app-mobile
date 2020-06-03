class UserModel {
  int id;
  String document;
  String password;
  String name;
  String email;
  String birthday;
  String sex;

  UserModel(
      {this.id,
      this.document,
      this.password,
      this.name,
      this.email,
      this.birthday,
      this.sex});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    document = json['document'];
    password = json['password'];
    name = json['name'];
    email = json['email'];
    birthday = json['birthday'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['document'] = this.document;
    data['password'] = this.password;
    data['name'] = this.name;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['sex'] = this.sex;
    return data;
  }
}
