import 'dart:math';

import 'package:e_ticaret_flutter/controller/order_controller.dart';
import 'package:e_ticaret_flutter/models/orders/my_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'my_order_detail_screen.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<OrderController>(context,listen: false).getOrderByUserId("test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: myBody(),
    );
  }



  myBody() {
    return SafeArea(child: ListView.builder(
      itemCount:context.watch<OrderController>().orders.length,
      itemBuilder: (context, index) {
        Order order=context.watch<OrderController>().orders[index];
        var randomNumber = Random().nextInt(5000-50);
      return ListTile(
        title: Text(order.basketItems!.first.name!),
        subtitle: Text("${randomNumber} TL"),
        leading: Text(order!.basketItems!.length.toString()!+" adet ürün"),
        trailing: IconButton(icon: Icon(Icons.shopping_cart_checkout_rounded),onPressed: (){
             Navigator.push(context,MaterialPageRoute(
                builder: (context) => MyOrderDetailScreen(order)));
        },),
        
      );
    }));
  }
}
