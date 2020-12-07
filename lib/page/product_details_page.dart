import 'package:dummy_carts/page/basket_page.dart';
import 'package:dummy_carts/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        actions: [
          Column(
            children: [
              Container(color:Colors.red,child: Text(store.getBaketQty().toString())),
              Icon(Icons.shopping_cart)
            ],
          )
          ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Image(image: AssetImage('graphics/background.png')),
            Text(store.activeProduct.name),
            Text(store.activeProduct.price.toString()),
            SizedBox(
              height: 200,
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.green,
                      onPressed: () {
                        store.addOneItem(store.activeProduct);
                      }),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(store.activeProduct.quality.toString()),
                  ),
                  IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.red,
                      onPressed: () {
                        store.removeOneItem(store.activeProduct);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
