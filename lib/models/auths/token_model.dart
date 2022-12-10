import 'package:flutter/material.dart';

class Token  {
  String? accessToken;
  String? expiration;
  String? refreshToken;

  Token({this.accessToken, this.expiration, this.refreshToken});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiration = json['expiration'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['expiration'] = this.expiration;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}