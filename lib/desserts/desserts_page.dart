import 'dart:ui';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/desserts/item_desserts.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDesserts> dessertsList;
  final List<ProductItemCart> cart;

  DessertsPage({
    Key key,
    @required this.dessertsList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bebidas",
          style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w100),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: dessertsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemDesserts(dessert: dessertsList[index], cart: cart);
          },
        ),
      ),
    );
  }
}
