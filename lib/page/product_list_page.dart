import 'package:dummy_carts/page/product_details_page.dart';
import 'package:dummy_carts/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    print(store.products[0].name);
    store.do1();
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: store.products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                store.setActiveProduct(store.products[index]);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsPage()));
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    child:  Image(image: AssetImage('graphics/background.png')),
                  ),
                  Text(store.products[index].name),
                ],
              ),
            );
          }),
    );
  }
}
