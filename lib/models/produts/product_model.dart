import 'package:e_ticaret_flutter/models/produts/product_image_files_model.dart';
class Product {
  String? id;
  String? name;
  int? stock;
  double? price;
  String? createdDate;
  String? updatedDate;
  List<ProductImageFiles>? productImageFiles;

  Product(
      {this.id,
        this.name,
        this.stock,
        this.price,
        this.createdDate,
        this.updatedDate,
        this.productImageFiles});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stock = json['stock'];
    price = json['price'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    if (json['productImageFiles'] != null) {
      productImageFiles = <ProductImageFiles>[];
      json['productImageFiles'].forEach((v) {
        productImageFiles!.add(new ProductImageFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['stock'] = this.stock;
    data['price'] = this.price;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.productImageFiles != null) {
      data['productImageFiles'] =
          this.productImageFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

