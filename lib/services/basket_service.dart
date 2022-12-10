import 'package:e_ticaret_flutter/core/services/http_generic_service.dart';
import 'package:flutter/material.dart';

import '../core/global_variables.dart';

class BasketService extends ChangeNotifier{

  var httpGenericService =HttpGenericService();

//https://localhost:7147/api/Baskets

  
  getBasketsFromApi()async{return await httpGenericService.genericHttGet(GlobalVariables.apiUrl+"Baskets");}


}