import 'package:e_ticaret_flutter/models/produts/product_model.dart';

class ProductImageFiles {
  Product? products;
  bool? showcase;
  String? fileName;
  String? path;
  String? storage;
  String? updatedDate;
  String? id;
  String? createdDate;

  ProductImageFiles(
      {this.products,
        this.showcase,
        this.fileName,
        this.path,
        this.storage,
        this.updatedDate,
        this.id,
        this.createdDate});

  ProductImageFiles.fromJson(Map<String, dynamic> json) {
    products = json['products'];
    showcase = json['showcase'];
    fileName = json['fileName'];
    //path = json['path'];
    path = ["", null].contains(json['path']) ? "null" : json['path'];
    storage = json['storage'];
    updatedDate = json['updatedDate'];
    id = json['id'];
    createdDate = json['createdDate'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products'] = this.products;
    data['showcase'] = this.showcase;
    data['fileName'] = this.fileName;
    data['path'] = this.path;
    data['storage'] = this.storage;
    data['updatedDate'] = this.updatedDate;
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    return data;
  }
}