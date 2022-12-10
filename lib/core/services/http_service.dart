import 'dart:core';

import 'package:e_ticaret_flutter/core/request_parameters.dart';
import 'package:http/http.dart' as http;

class  HttpService {
  String _baseUrl = "https://localhost:7147";

  String _url(RequestParameters requestParameter) {
    String? q = requestParameter.baseUrl != null
        ? requestParameter.baseUrl
        : _baseUrl;
    String? w = "/" + requestParameter.controller!;
    String e = requestParameter.action! != null
        ? "/" + requestParameter.action!
        : "";
    return "$q$w$e";
  }

  String getValue() {
    RequestParameters params = new RequestParameters();
    params.controller = "Orders";
    params.baseUrl = "http://localhost:7147";
    params.action = "get";
    return _url(params);
  }

  genericHttGet(String path) async {
    var response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Authorization': "getToken"
      },
    );
    if (response.statusCode != 200){
      print(response.statusCode);
      return print(response.body);
    }

    else{
    print("Body : "+response.body);
    return response;
  }}

}