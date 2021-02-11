import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/login/login.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  //Controladores para almacenar valores
  var _usernameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  // Para el boton de tipo check
  bool _checkedListTile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),

              //Imagen de CUPPING CON LOGO
              Image(
                image: AssetImage("assets/images/cupping.png"),
                height: 200,
                width: 300,
              ),

              SizedBox(
                height: 30,
              ),

              //Ingresar usuario
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre completo:',
                    style: TextStyle(
                      color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                    ),
                  //Contenedor para el TextField
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.95, // para que abarque casi todo el ancho de la pantalla
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              //Ingresar email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(
                      color: Colors.white, fontFamily: 'OpenSans',
                    ),
                  ),
                  //Contenedor para el TextField
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.95, // para que abarque casi todo el ancho de la pantalla
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password:',
                    style: TextStyle(
                      color: Colors.white, fontFamily: 'OpenSans',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 0.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CheckboxListTile(
                title: Text(
                  "ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO",
                  style: TextStyle(
                    color: Colors.white, fontFamily: 'OpenSans', fontSize: 10
                  ),
                ),
                value: _checkedListTile,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  setState(() {
                    _checkedListTile = value;
                  });
                },
              ),

              SizedBox(
                height: 30,
              ),
              //Boton de ENTRAR
              Container(
                width: MediaQuery.of(context).size.width *
                    0.95, // para que abarque casi todo el ancho de la pantalla
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "REGISTRATE",
                    style: TextStyle(
                      fontFamily: 'AkzidenzGrotesk',
                    ),
                  ),
                  color: Color(0xffBCB0A1),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ),

              SizedBox(
                height: 50,
              ),

              Column(
                children: [
                  Text(
                    "¿Ya tienes una cuenta?",
                    style: TextStyle(
                      color: Colors.white, fontFamily: 'OpenSans',
                    ),
                  ),
                  MaterialButton(
                    child: Text(
                      "INGRESA",
                      style: TextStyle(
                        color: Colors.white, fontFamily: 'OpenSans',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
