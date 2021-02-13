import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cart = ProductCart(productsInCart: []);
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Inicio"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                // TODO: Eliminar este boton y adaptar todo el contenido de la pagina de perfil en un Drawer aqui en la pantalla Home
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(productsList: cart.productsInCart)));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap:  _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: (){
               _scaffoldKey.currentState
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                  SnackBar(content: Text("Proximamente")));
            },
            child: ItemHome(
              // TODO: Al hacer clic, que muestre un snackbar de "Proximamente"
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinksPage(
            drinksList: ProductRepository.loadProducts(ProductType.BEBIDAS),
            cart: cart.productsInCart,
          );
        },
      ),
    );
  }

  void _openGrainsPage() {
Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GrainsPage(
            grainsList: ProductRepository.loadProducts(ProductType.GRANO),
            cart: cart.productsInCart,
          );
        },
      ),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DessertsPage(
            dessertsList: ProductRepository.loadProducts(ProductType.POSTRES),
            cart: cart.productsInCart,
          );
        },
      ),
    );
  }
}
