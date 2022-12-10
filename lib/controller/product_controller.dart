import 'dart:convert';

import 'package:e_ticaret_flutter/models/produts/product_model.dart';
import 'package:e_ticaret_flutter/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  var products = <Product>[];
  List<Product> get getAllProducts => products;
  var productService = ProductService();

  getProducts() async {
    try {
      await productService.getProductsFromApi().then((response) {
        var result = (jsonDecode(response.body)["products"] as List)
            .map((e) => Product.fromJson(e))
            .toList();
        products = result;
        });
    } finally {}
    notifyListeners();
    print("fonk çalıştı");
  }
}
