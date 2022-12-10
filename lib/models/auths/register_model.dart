class RegisterModel {
  String? name;
  String? surname;
  String? username;
  String? email;
  String? password;
  String? rePassword;

  RegisterModel(
      {this.name,
        this.surname,
        this.username,
        this.email,
        this.password,
        this.rePassword});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rePassword'] = this.rePassword;
    return data;
  }
}