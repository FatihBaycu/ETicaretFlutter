import 'dart:convert';
import 'package:e_ticaret_flutter/core/global_variables.dart';
import 'package:e_ticaret_flutter/core/services/http_generic_service.dart';
import 'package:e_ticaret_flutter/models/auths/login_model.dart';
import 'package:e_ticaret_flutter/models/auths/register_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../../models/auths/token_model.dart';

class AuthService extends ChangeNotifier{


  String apiUrl=GlobalVariables.apiUrl;
  Token token=Token();
  Token get getToken=>token;
  var httpGenericService=HttpGenericService();


  Future<void>login(LoginModel loginModel)async {
    var response = await http.post(
        Uri.parse(apiUrl + "Auth/Login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginModel.toJson())
    );
    if (response.statusCode == 200) {
      token = Token.fromJson(json.decode(response.body)["token"]);
      notifyListeners();
      token.accessToken = "Bearer ${token.accessToken}";
      //authController.token(token);
      //userController.getUserByEmail(userForLogin.email!);
      //Get.to(CarListScreen());
    }
    else {
      print(response.body);
      //Get.snackbar("Login Error", response.body);
    }
  }

  register(RegisterModel registerModel)async{
    var response=await http.post(
        Uri.parse(apiUrl+"Auth/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(registerModel.toJson())
    );

    if(response.statusCode==200){
      print(response.body);
      //Get.offAll(LoginScreen());
      //Get.snackbar("Success", "You can login now");
    }
    else{
      //Get.snackbar("Error", response.body);
    }
    return response;
  }


}