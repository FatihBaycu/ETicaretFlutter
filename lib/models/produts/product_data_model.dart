import 'package:e_ticaret_flutter/models/produts/product_model.dart';

class ProductData {
  int? totalProductCount;
  List<Product>? products;

  ProductData({this.totalProductCount, this.products});

  ProductData.fromJson(Map<String, dynamic> json) {
    totalProductCount = json['totalProductCount'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalProductCount'] = this.totalProductCount;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}