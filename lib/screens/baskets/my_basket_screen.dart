import 'package:e_ticaret_flutter/controller/basket_controller.dart';
import 'package:e_ticaret_flutter/models/baskets/basket_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBasketScreen extends StatefulWidget {
  const MyBasketScreen({Key? key}) : super(key: key);

  @override
  _MyBasketScreenState createState() => _MyBasketScreenState();
}

class _MyBasketScreenState extends State<MyBasketScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<BasketController>(context, listen: false).getBasket();
  }

  //aynı eklenen ürünlerin adet fiyatının artması --
  //toplam sepet miktarının hesaplanması ++

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          ElevatedButton(onPressed: (){}, child: Text("Complete Order"))
        ],
      ),
      body: SafeArea(
        child: myBody(),
      ),
    );
  }

  calculateTotalPrice() {
    double totalPrice = 0;
    if (context.watch<BasketController>().basketItems.length != 0) {
      for (int i = 0; i <= context.watch<BasketController>().basketItems.length; i++) {
        totalPrice += context.watch<BasketController>().basketItems[i].price! * context.watch<BasketController>().basketItems[i].quantity!;
      }
      return totalPrice;
    }
    return totalPrice;
  }

  myBody() {
    return SafeArea(
      child: ListView.builder(
        itemCount: context.watch<BasketController>().basketItems.length,
        itemBuilder: (BuildContext context, int index) {
          Basket basket = context.watch<BasketController>().basketItems[index];
          double totalProductPrice = basket.price! * basket.quantity!;
          return ListTile(
            title: Text(basket.name!),
            subtitle: Text("Price: " + basket.price.toString()),
            leading: Text(basket.quantity.toString() + "\nQuantity",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            trailing: Wrap(
              spacing: 12,
              alignment: WrapAlignment.center,
              children: <Widget>[
                Text(totalProductPrice.toString() + " TL"),
                IconButton(icon:Icon(Icons.remove_shopping_cart),color: Colors.red,onPressed: () {                              
                  Provider.of<BasketController>(context,listen: false).removeFromBasket(basket.basketItemId.toString());                
                },),
              ],
            ),
          );
        },
      ),
    );
  }
}
