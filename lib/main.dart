import 'dart:io';
import 'package:e_ticaret_flutter/controller/basket_controller.dart';
import 'package:e_ticaret_flutter/controller/order_controller.dart';
import 'package:e_ticaret_flutter/controller/product_controller.dart';
import 'package:e_ticaret_flutter/screens/products/product_list_screen.dart';
import 'package:e_ticaret_flutter/services/auths/auth_service.dart';
import 'package:e_ticaret_flutter/services/users/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/my_http_override.dart';

void main() {

HttpOverrides.global =  MyHttpOverrides();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthService()),
      ChangeNotifierProvider(create: (_) => UserService()),
      ChangeNotifierProvider(create: (_) => ProductController()),
      ChangeNotifierProvider(create: (_) => BasketController()),
      ChangeNotifierProvider(create: (_) => OrderController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Provider.of<ProductController>(context).getProducts();
    return MaterialApp(
      home: ProductListScreen(),
    );
  }
}
