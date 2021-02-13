import 'package:estructura_practica_1/cart/payment.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class ItemDessertsDetails extends StatefulWidget {
  final List<ProductItemCart> cart;

  ItemDessertsDetails({
    Key key,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemDessertsDetailsState createState() => _ItemDessertsDetailsState();
}

class _ItemDessertsDetailsState extends State<ItemDessertsDetails> {
  bool sizeCH = false;
  bool sizeM = true;
  bool sizeG = false;
  @override
  Widget build(BuildContext context) {
    ProductDesserts item = ModalRoute.of(context).settings.arguments;
    item = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${item.productTitle}",
          style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w100),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      color: Color(0xffFABF7C),
                      width: 325,
                      height: 325,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: item.liked
                                ? Colors.red[800]
                                : Color(0xff121B22),
                          ),
                          onPressed: () {
                            item.liked = !item.liked;
                            setState(() {});
                          },
                        ),
                      )),
                  Image.network(
                    "${item.productImage}",
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text("${item.productTitle}",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w200,
                        fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Flexible(
                  child: Text("${item.productDescription}",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w100,
                          fontSize: 16)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TAMAÑOS DISPONIBLES",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w100,
                          fontSize: 10)),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text("\$${item.productPrice}",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 30)),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      color: Color(0xff8B8175),
                      child: Text("AGREGAR AL CARRITO",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w100,
                              color: Colors.white)),
                      onPressed: () {
                        widget.cart.add(ProductItemCart(
                          productTitle: item.productTitle,
                          productImage: item.productImage,
                          productAmount: 1,
                          productPrice: item.productPrice,
                          typeOfProduct: ProductType.BEBIDAS,
                          productSize: "Unico",
                        ));
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                      color: Color(0xff8B8175),
                      child: Text("COMPRAR AHORA",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w100,
                              color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Payment(cart: widget.cart)));
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
