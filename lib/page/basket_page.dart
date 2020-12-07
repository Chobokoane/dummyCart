import 'package:dummy_carts/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Basket "),
        actions: [
          Text(store.getBaketQty().toString()),
        ],
      ),
      body: ListView.builder(
          itemCount: store.baskets.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FadeInImage.assetNetwork(
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                    placeholder: "assets/images/200.gif",
                    image: store.activeProduct.pic,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(store.baskets[index].name),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              store.addOneItem(store.baskets[index]);
                            }),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color:Colors.grey )
                          ),
                            child:
                                Text(store.baskets[index].quality.toString()),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                            onPressed: (){
                              store.removeOneItem(store.baskets[index]);
                            }),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
