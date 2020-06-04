class UserModel {
  int id;
  String document;
  String password;
  String name;
  String email;
  String birthday;
  String sex;
  String photo;
  String googleToken;
  String facebookToken;
  String appleToken;

  String provider;
  String providerToken;

  UserModel(
      {this.id,
      this.document,
      this.password,
      this.name,
      this.email,
      this.birthday,
      this.sex,
      this.photo,
      this.googleToken,
      this.facebookToken,
      this.appleToken,
      this.provider,
      this.providerToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    document = json['document'];
    password = json['password'];
    name = json['name'];
    email = json['email'];
    birthday = json['birthday'];
    sex = json['sex'];
    photo = json['phone'];
    googleToken = json['google_token'];
    facebookToken = json['facebook_token'];
    appleToken = json['apple_token'];

    provider = json['provider'];
    providerToken = json['provider_token'];
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
    data['photo'] = this.photo;
    data['google_token'] = this.googleToken;
    data['facebook_token'] = this.facebookToken;
    data['apple_token'] = this.appleToken;

    data['provider'] = this.provider;
    data['provider_token'] = this.providerToken;
    return data;
  }
}
