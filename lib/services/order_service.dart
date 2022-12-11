import '../core/global_variables.dart';
import '../core/services/http_generic_service.dart';

class OrderService{
    var httpGenericService =HttpGenericService();

//https://localhost:7147/api/Baskets

  String myUserId="a1d5dda8-2eb1-4c66-a831-a99a0d95073d";
  getOrdersByUserIdFromApi(String userId)async{return await httpGenericService.genericHttGet(GlobalVariables.apiUrl+"Orders/get-orders-by-user?UserId="+myUserId);}
}