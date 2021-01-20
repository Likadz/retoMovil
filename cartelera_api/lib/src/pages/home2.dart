import 'package:flutter/material.dart';
import 'package:peliculas/src/models/rutas.dart';
import 'package:peliculas/src/providers/rutas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

//TUTORIAL DE YOUTUBE
//https://www.youtube.com/watch?v=6kaEbTfb444&ab_channel=MarcusNg

class Home2Page extends StatefulWidget {
  Home2Page({Key key}) : super(key: key);

  @override
  _Home2PageState createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {

  var lista;
  var listadoRutas;
  
  @override
  void initState() {
    RutasProvider.getRutas().then((response) {
      
      lista = response;
/*
      for(Rutas ruta in lista){
        listadoRutas.add(ruta);
        print(ruta);
      }*/
      
      print("LISTA USUARIOS " + lista.toString());
      print("LISTA 0 " + lista[0]['nombre'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(17,75,95,1),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //_ciudad(context),
           // _swiperTarjetas(),
           Column(
             children: [
               Text(lista[0]['nombre'].toString()),
             ],
           )
            //CardSwiper( rutas: listadoRutas ),
            //_footer(context)
          ],
        ),
      )
       
    );
    /*return Scaffold(
      body: Stack(
        children: <Widget> [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                
                  Colors.purple,
                  
                  Colors.indigo,
                 
                ],
              )
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 60.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('images/explorer.png'),
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  
                  SizedBox(
                    height: 30.0,
                  ),
                  
                  crearBLogin(),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );*/
  }
 
}
