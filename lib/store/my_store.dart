import 'package:dummy_carts/model/product.dart';
import 'package:flutter/material.dart';

class MyStore extends ChangeNotifier {
  List<Product> _product = [];
  List<Product> _baskets = [];
  Product activeProduct = null;

  MyStore() {
    _product = [
      Product(
          id: 1,
          quality: 1,
          name: "Mango",
          price: 12.00,
          pic:"assets/images/mango.jpg"),
      Product(
          id: 2,
          quality: 1,
          name: "Apple",
          price: 12.00,
          pic:"https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.ctfassets.net%2Fcnu0m8re1exe%2F6uSVPiUx1FloQ23j38x2aM%2F0eafe5c0d6b3ce7e3aae6b389a997423%2FGrapes.jpg%3Fw%3D650%26h%3D433%26fit%3Dfill&imgrefurl=https%3A%2F%2Fwww.discovermagazine.com%2Fthe-sciences%2Fphysicists-finally-discover-why-grapes-ignite-in-the-microwave&tbnid=w-msAYCnrh5AUM&vet=12ahUKEwj5otmDkrztAhVB0-AKHYxNDV0QMygBegUIARDWAQ..i&docid=_djBjAUFAH84LM&w=650&h=433&q=grape&ved=2ahUKEwj5otmDkrztAhVB0-AKHYxNDV0QMygBegUIARDWAQ"),
      Product(
          id: 3,
          quality: 1,
          name: "Banana",
          price: 12.00,
          pic:
          "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.ctfassets.net%2Fcnu0m8re1exe%2F6uSVPiUx1FloQ23j38x2aM%2F0eafe5c0d6b3ce7e3aae6b389a997423%2FGrapes.jpg%3Fw%3D650%26h%3D433%26fit%3Dfill&imgrefurl=https%3A%2F%2Fwww.discovermagazine.com%2Fthe-sciences%2Fphysicists-finally-discover-why-grapes-ignite-in-the-microwave&tbnid=w-msAYCnrh5AUM&vet=12ahUKEwj5otmDkrztAhVB0-AKHYxNDV0QMygBegUIARDWAQ..i&docid=_djBjAUFAH84LM&w=650&h=433&q=grape&ved=2ahUKEwj5otmDkrztAhVB0-AKHYxNDV0QMygBegUIARDWAQ"),
      Product(
          id: 4,
          quality: 1,
          name: "Grape",
          price: 12.00,
          pic:
              "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.ctfassets.net%2Fcnu0m8re1exe%2F6uSVPiUx1FloQ23j38x2aM%2F0eafe5c0d6b3ce7e3aae6b389a997423%2FGrapes.jpg%3Fw%3D650%26h%3D433%26fit%3Dfill&imgrefurl=https%3A%2F%2Fwww.discovermagazine.com%2Fthe-sciences%2Fphysicists-finally-discover-why-grapes-ignite-in-the-microwave&tbnid=w-msAYCnrh5AUM&vet=12ahUKEwj5otmDkrztAhVB0-AKHYxNDV0QMygBegUIARDWAQ..i&docid=_djBjAUFAH84LM&w=650&h=433&q=grape&ved=2ahUKEwj5otmDkrztAhVB0-AKHYxNDV0QMygBegUIARDWAQ")
    ];
    notifyListeners();
  }

  List<Product> get products => _product;

  List<Product> get baskets => _baskets;

  Product get activeProducts => activeProduct;

  do1() {
    _product[0].id = 5;
  }

  setActiveProduct(Product p) {
    activeProduct = p;
  }

  addOneItem(Product p) {
    Product found =
        _baskets.firstWhere((a) => a.id == p.id, orElse: () => null);
    if (found != null) {
      found.quality += 1;
    } else {
      _baskets.add(p);
    }
    notifyListeners();
  }

  removeOneItem(Product p) {
    Product found =
        _baskets.firstWhere((a) => a.id == p.id, orElse: () => null);
    if (found != null && found.quality == 1) {
      _baskets.remove(p);
    } else {
      found.quality -= 1;
    }
    notifyListeners();
  }
  getBaketQty(){
    int total = 0;
    for(int i= 0; i< baskets.length; i++){
      total = baskets[i].quality;
    }
    return total;
  }
}
