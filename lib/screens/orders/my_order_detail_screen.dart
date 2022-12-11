import 'package:e_ticaret_flutter/components/image_widget.dart';
import 'package:e_ticaret_flutter/core/global_variables.dart';
import 'package:flutter/material.dart';

import '../../models/orders/my_orders_model.dart';

class MyOrderDetailScreen extends StatefulWidget {
  Order order;
  MyOrderDetailScreen(this.order);

  @override
  State<MyOrderDetailScreen> createState() =>
      _MyOrderDetailScreenState(this.order);
}

class _MyOrderDetailScreenState extends State<MyOrderDetailScreen> {
  Order order;
  _MyOrderDetailScreenState(this.order);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Order")),
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(
        child: ListView.builder(
            itemCount: order.basketItems!.length,
            itemBuilder: ((context, index) {
              return basketItemsRow(order, index);
            })));
  }

  basketItemsRow(Order order, int index) {
    return Row(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .3,
            child: imageWidget(order.basketItems![index].path != null
                ? GlobalVariables.apiUrlBase + order.basketItems![index].path!
                : GlobalVariables.apiUrlBase +
                    "photo-images/default-product.webp")),
        Column(
          children: [
            Text(order.basketItems![index].name!),
            Text(order.basketItems![index].price.toString() + " TL"),
            Text(order.basketItems![index].quantity.toString() + " Quantity"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(onPressed: (){
             //todo ürün detayına gidecek.
             //todo orderDetails güzelleştirilecek.
             //todo totalOrderPrice gözükecek. 
          }, child: Text("get product")),
        )
      ],
    );
  }
}
