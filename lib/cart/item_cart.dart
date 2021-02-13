import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFABF7C),
      margin: EdgeInsets.all(24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Image.network(
                "${widget.product.productImage}",
                height: 150,
                width: 150,
              ),
            ),
          ),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.product.productTitle}",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w100,
                      fontSize: 20)
              ),
              Text("${widget.product.productSize}",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontSize: 16)
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: _addProd),
                  Text("${widget.product.productAmount}"),
                  IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: _remProd),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text("\$${widget.product.productPrice}",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 24)),
                  ),
                  SizedBox(
                    height: 12,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }
}
