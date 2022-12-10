import 'package:e_ticaret_flutter/core/global_variables.dart';
import 'package:e_ticaret_flutter/core/services/http_generic_service.dart';
import 'package:provider/provider.dart';


class ProductService{

  var httpGenericService =HttpGenericService();

  getProductsFromApi()async{return await httpGenericService.genericHttGet(GlobalVariables.apiUrl+"Products?Size=23");}
}