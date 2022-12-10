import 'package:e_ticaret_flutter/controller/basket_controller.dart';
import 'package:e_ticaret_flutter/controller/product_controller.dart';
import 'package:e_ticaret_flutter/models/baskets/basket_add_model.dart';
import 'package:e_ticaret_flutter/models/produts/product_model.dart';
import 'package:e_ticaret_flutter/screens/baskets/my_basket_screen.dart';
import 'package:e_ticaret_flutter/screens/products/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/drawer.dart';
import '../../components/image_widget.dart';
import '../../core/global_variables.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductController>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: MyDrawer(context),
      body: myBody(),
    );
  }

  myAppBar() {
    return AppBar(
      title: const Text("Products"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyBasketScreen()));
            },
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }

  myBody() {
    return SafeArea(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: context.watch<ProductController>().products.length,
        itemBuilder: (BuildContext context, int index) {
          Product product = context.watch<ProductController>().products[index];
          return ListTile(
            leading: CircleAvatar(
               backgroundColor: Colors.transparent,
              child: imageWidgetForCircleAvatar(product.productImageFiles!.isEmpty ? GlobalVariables.apiUrlBase+"photo-images/default-product.webp":GlobalVariables.apiUrlBase+product.productImageFiles!.first.path.toString()
              ),),
              title: Text(product.name!),
               trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                Provider.of<BasketController>(context, listen: false)
                    .addToBasket(
                        BasketAddModel(productId: product.id, quantity: 1));

                /*  Provider.of<BasketController>(context, listen: false).addBasket(Basket(
                    basketItemId: "RANDOM",
                    name: product.name,
                    price: product.price,
                    productId: product.id,
                    quantity: 2)
                    );*/

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          );
        },
      ),
    );
  }

  TextButton newMethod(BuildContext context, Product product) {
    return TextButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.indigoAccent)),
      child: const Text(
        "Details",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product)));
      },
    );
  }

  SnackBar snackBar = SnackBar(
    content: const Text(
      "Added to cart",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: (Colors.black),
    action: SnackBarAction(
      label: 'dismiss',
      onPressed: () {},
    ),
  );
}
