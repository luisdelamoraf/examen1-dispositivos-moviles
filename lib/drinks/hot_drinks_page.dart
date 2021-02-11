import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
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
          itemCount: drinksList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemHotDrinks(
              drink: drinksList[index],
            );
          },
        ),
      ),
    );
  }
}
