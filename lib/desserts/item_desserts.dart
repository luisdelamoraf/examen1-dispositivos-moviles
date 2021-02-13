import 'package:estructura_practica_1/desserts/item_desserts_details.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDesserts dessert;
  final List<ProductItemCart> cart;
  ItemDesserts({
    Key key,
    @required this.dessert,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
  @override
  Widget build(BuildContext context) {
    print(widget.dessert.productPriceCalculator);
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDessertsDetails(cart: widget.cart),
            settings: RouteSettings(arguments: widget.dessert)));
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
                    Text("${widget.dessert.productTitle}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w100)),
                    Text(
                      "\$${widget.dessert.productPrice}",
                      style: TextStyle(fontSize: 26, fontFamily: "OpenSans", fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Image.network(
                "${widget.dessert.productImage}",
                height: 150,
                width: 150,
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: widget.dessert.liked
                        ? Colors.red[800]
                        : Color(0xff121B22),
                  ),
                  onPressed: () {
                    widget.dessert.liked = !widget.dessert.liked;
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
