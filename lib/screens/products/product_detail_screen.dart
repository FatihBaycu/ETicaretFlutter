import 'package:e_ticaret_flutter/controller/basket_controller.dart';
import 'package:e_ticaret_flutter/core/global_variables.dart';
import 'package:e_ticaret_flutter/models/baskets/basket_add_model.dart';
import 'package:e_ticaret_flutter/models/baskets/basket_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/image_widget.dart';
import '../../models/produts/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  Product? product;
  ProductDetailScreen(this.product);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState(this.product);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product? product;
  _ProductDetailScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: SafeArea(child: myBody(),),
    );
  }

int count=1;
  myBody() {
    return ListView(children: [
      Column(
        children: [
          Container(
            width: 400,
            height: 300,
            child: product!.productImageFiles!.isEmpty ? imageWidget(GlobalVariables.apiUrlBase+"photo-images/default-product.webp") : imageWidget(GlobalVariables.apiUrlBase+product!.productImageFiles!.first.path.toString()),
          ),
          listTile(product!.name!, "Product name"),
          listTile(product!.price.toString(), "Price"),
          listTile(product!.stock.toString(), "Stock"),
          ListTile(
           leading: IconButton(icon:Icon(Icons.remove,color: Colors.red),onPressed: (){
             setState(() {
               if(count!=1)
                  count--;
             });
           },),
          trailing: IconButton(icon:Icon(Icons.add,color:Colors.green),onPressed: (){
            setState(() {
              if(product!.stock!>count)
                  count++;
            });
          },),
          title: Row(children: [
            Text("Quantity"),
            Text("                ${count}"),
          ]
    )),
          Center(child: ElevatedButton(child: Text("Add to cart"),onPressed: (){
            context.read<BasketController>().addToBasket(BasketAddModel(
              quantity: count,
              productId: product!.id
            ));
          },),)
        ],

      ),
    ]);
  }
  Widget listTile(String field, String value) {
    return ListTile(
      //leading: Image.network(book!.image!),
      subtitle: Text(
        field,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      title: Text(value, style: TextStyle(fontWeight: FontWeight.bold))
    );
  }

}
