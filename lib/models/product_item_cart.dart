import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  String productImage;
  int productAmount;
  double productPrice;
  String productSize;
  final ProductType typeOfProduct;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productImage,
    @required this.productAmount,
    @required this.productPrice,
    @required this.productSize,
  });
}
