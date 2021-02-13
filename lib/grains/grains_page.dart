import 'dart:ui';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainsList;
  final List<ProductItemCart> cart;

  GrainsPage({
    Key key,
    @required this.grainsList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Granos",
          style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w100),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: grainsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemGrains(
              grain: grainsList[index],
              cart: cart
            );
          },
        ),
      ),
    );
  }
}
