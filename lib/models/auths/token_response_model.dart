import 'package:e_ticaret_flutter/models/auths/token_model.dart';
class TokenResponseModel {
  Token? token;

  TokenResponseModel({this.token});

  TokenResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token!.toJson();
    }
    return data;
  }
}