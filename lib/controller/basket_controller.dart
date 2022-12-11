import 'dart:convert';
import 'package:e_ticaret_flutter/core/global_variables.dart';
import 'package:e_ticaret_flutter/core/services/http_generic_service.dart';
import 'package:e_ticaret_flutter/models/baskets/basket_add_model.dart';
import 'package:e_ticaret_flutter/models/baskets/basket_model.dart';
import 'package:e_ticaret_flutter/services/basket_service.dart';
import 'package:flutter/material.dart';

class BasketController extends ChangeNotifier{

  List<Basket> basketItems= <Basket>[];
  var genericService=HttpGenericService();
  var basketService=BasketService();

  addToBasket(BasketAddModel basketAddModel){
    return genericService.generateHttpPost(basketAddModel, GlobalVariables.apiUrl+"Baskets");
  }

  getBasket() async {
    try {
      await basketService.getBasketsFromApi().then((response) {
        var result = (jsonDecode(response.body) as List)
            .map((e) => Basket.fromJson(e))
            .toList();
        basketItems = result;
        });
    } finally {}
    notifyListeners();
    print("fonk çalıştı");
  }

  void removeFromBasket(String basketItemId){
        genericService.generateHttpDeleteWithQuery(basketItemId, GlobalVariables.apiUrl+"Baskets/");
        getBasket();
        notifyListeners();
  }



}