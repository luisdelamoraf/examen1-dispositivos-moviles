import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    print(widget.drink.productPriceCalculator);
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemHotDrinksDetails(),
            settings: RouteSettings(arguments: widget.drink)));
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(color: Color(0xffBCB0A1), boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 1))
          ]),
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Café",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w100)),
                    Text("${widget.drink.productTitle}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w100)),
                    Text(
                      "\$${widget.drink.productPrice}",
                      style: TextStyle(fontSize: 26, fontFamily: "OpenSans", fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Image.network(
                "${widget.drink.productImage}",
                height: 150,
                width: 150,
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: widget.drink.liked
                        ? Colors.red[800]
                        : Color(0xff121B22),
                  ),
                  onPressed: () {
                    widget.drink.liked = !widget.drink.liked;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
