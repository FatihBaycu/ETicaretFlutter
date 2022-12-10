class Basket {
  String? basketItemId;
  String? name;
  double? price;
  int? quantity;
  String? productId;

  Basket({this.basketItemId, this.name, this.price, this.quantity,this.productId});

  Basket.fromJson(Map<String, dynamic> json) {
    basketItemId = json['basketItemId'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['basketItemId'] = this.basketItemId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}