import 'dart:convert';

import 'package:e_ticaret_flutter/core/global_variables.dart';
import 'package:e_ticaret_flutter/core/services/http_generic_service.dart';
import 'package:e_ticaret_flutter/models/users/user_model.dart';
import 'package:flutter/material.dart';

class UserService extends ChangeNotifier{

  var apiUrl=GlobalVariables.apiUrl;
  var httpGenericService =HttpGenericService();

  var userModel=UserModel();
  UserModel get getUserModel=>userModel;

  getUserByEmail (String email) async {
    var response=await httpGenericService.genericHttGet(apiUrl+"Users/?Email=${email}");
    userModel=UserModel.fromJson(jsonDecode(response.body));
    notifyListeners();
    print(userModel.email);
  }

}