import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  final List<ProductItemCart> cart;
  Payment({Key key, @required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Pagos",
            style:
                TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w100),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 16),
              child: Text("Elige tu método de pago",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w400,
                      fontSize: 24)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: FlatButton(
                child: Container(
                  height: 150,
                  child: Card(
                    color: Color(0xffBCB0A1),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card_outlined,
                          size: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Tarjeta de crédito",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 24)),
                        )
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      AlertDialog alert = AlertDialog(
                        title: Text("Orden Exitosa"),
                        content: Text(
                            "Tu orden ha sido registrada y será procesada a continuación. Gracias por tú compra"),
                        actions: [
                          FlatButton(
                            child: Text("ACEPTAR"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                      return alert;
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: FlatButton(
                child: Container(
                  height: 150,
                  child: Card(
                    color: Color(0xffBCB0A1),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/paypal.png"),
                          height: 100,
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("PayPal",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 24)),
                        )
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      AlertDialog alert = AlertDialog(
                        title: Text("Orden Exitosa"),
                        content: Text(
                            "Tu orden ha sido registrada y será procesada a continuación. Gracias por tú compra"),
                        actions: [
                          FlatButton(
                            child: Text("ACEPTAR"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                      return alert;
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: FlatButton(
                child: Container(
                  height: 150,
                  child: Card(
                    color: Color(0xffBCB0A1),
                    child: Row(
                      children: [
                        Icon(
                          Icons.card_giftcard_outlined,
                          size: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Tarjeta de regalo",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 24)),
                        )
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      AlertDialog alert = AlertDialog(
                        title: Text("Orden Exitosa"),
                        content: Text(
                            "Tu orden ha sido registrada y será procesada a continuación. Gracias por tú compra"),
                        actions: [
                          FlatButton(
                            child: Text("ACEPTAR"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                      return alert;
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
