import 'package:dummy_carts/page/product_list_page.dart';
import 'package:dummy_carts/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
      ChangeNotifierProvider(
        create: (context){
          return MyStore();
        },
          child: MaterialApp(debugShowCheckedModeBanner:false,home: ProductList())));
}
