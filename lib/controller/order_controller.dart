import 'dart:convert';

import 'package:e_ticaret_flutter/models/orders/my_orders_model.dart';
import 'package:e_ticaret_flutter/services/order_service.dart';
import 'package:flutter/widgets.dart';

class OrderController extends ChangeNotifier{

var orders=<Order>[];
var orderService=OrderService();

  getOrderByUserId(String userId) async {
    try {
      await orderService.getOrdersByUserIdFromApi(userId).then((response) {
        var result = (jsonDecode(response.body)["orders"] as List)
            .map((e) => Order.fromJson(e))
            .toList();
        orders = result;
        });
    } finally {}
    notifyListeners();
    print(orders.first.basketItems!.first.name);
  }

}