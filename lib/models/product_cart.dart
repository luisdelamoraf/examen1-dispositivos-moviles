import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class ProductCart {
  List<ProductHotDrinks> drinks;
  List<ProductGrains> grains;
  List<ProductGrains> desserts;
  List<ProductItemCart> productsInCart;

  ProductCart({
    this.drinks,
    this.grains,
    this.desserts,
    this.productsInCart,
  });
}
