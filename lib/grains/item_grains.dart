import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  final List<ProductItemCart> cart;
  ItemGrains({
    Key key,
    @required this.grain,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  @override
  Widget build(BuildContext context) {
    print(widget.grain.productPriceCalculator);
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemGrainsDetails(cart: widget.cart),
            settings: RouteSettings(arguments: widget.grain)));
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
                    Text("${widget.grain.productTitle}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w100)),
                    Text(
                      "\$${widget.grain.productPrice}",
                      style: TextStyle(fontSize: 26, fontFamily: "OpenSans", fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Image.network(
                "${widget.grain.productImage}",
                height: 150,
                width: 150,
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: widget.grain.liked
                        ? Colors.red[800]
                        : Color(0xff121B22),
                  ),
                  onPressed: () {
                    widget.grain.liked = !widget.grain.liked;
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
