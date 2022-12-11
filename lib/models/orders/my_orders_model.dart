class MyOrder {
  List<Order>? orders;

  MyOrder({this.orders});

  MyOrder.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  String? address;
  List<BasketItems>? basketItems;
  String? createdDate;
  String? description;
  String? id;
  String? orderCode;
  bool? completed;

  Order(
      {this.address,
      this.basketItems,
      this.createdDate,
      this.description,
      this.id,
      this.orderCode,
      this.completed});

  Order.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    if (json['basketItems'] != null) {
      basketItems = <BasketItems>[];
      json['basketItems'].forEach((v) {
        basketItems!.add(new BasketItems.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    description = json['description'];
    id = json['id'];
    orderCode = json['orderCode'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    if (this.basketItems != null) {
      data['basketItems'] = this.basketItems!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;
    data['description'] = this.description;
    data['id'] = this.id;
    data['orderCode'] = this.orderCode;
    data['completed'] = this.completed;
    return data;
  }
}

class BasketItems {
  String? name;
  double? price;
  int? quantity;
  String? path;

  BasketItems({this.name, this.price, this.quantity, this.path});

  BasketItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['path'] = this.path;
    return data;
  }
}
