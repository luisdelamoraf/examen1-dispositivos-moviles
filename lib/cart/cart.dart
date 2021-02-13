import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: widget.productsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCart(
                    onAmountUpdated: _priceUpdate,
                    product: widget.productsList[index],
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(left:16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Total: \$$_total",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 30)),
                    Padding(
                      padding: const EdgeInsets.only(top:4 , bottom: 4),
                      child: Container(
                        width: MediaQuery.of(context).size.width *.91,
                        child: RaisedButton(
                          color: Color(0xff8B8175),
                          child: Text("PAGAR",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w100,
                              )
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
