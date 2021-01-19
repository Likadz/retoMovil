import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/informacion.dart';
import 'package:peliculas/src/providers/rutas_provider.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buscador.dart';

class HomePage extends StatelessWidget {

  final rutasProvider = new RutasProvider();

  @override
  Widget build(BuildContext context) {

    //peliculasProvider.getPopulares();


    return Scaffold(
      backgroundColor:  Color.fromRGBO(17,75,95,1),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _ciudad(context),
            _swiperTarjetas(),
            _footer(context)
          ],
        ),
      )
       
    );
  }

  Widget _swiperTarjetas() {

    return FutureBuilder(
      future: rutasProvider.getRutas(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return CardSwiper( Rutas: snapshot.data );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
        
      },
    );
  }


  Widget _footer(BuildContext context){

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            //padding: EdgeInsets.only(left: 20.0),
            child: 
              RaisedButton(
                onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),
                  );
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(26,147,111, 1),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child:
                      Text(
                        'RANKING',
                        style:
                        GoogleFonts.pressStart2p(
                          fontStyle: FontStyle.italic, 
                          fontSize: 40, 
                          foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Color.fromRGBO(243,233,210,1), 
                        ) 
                      ),
                ),
              ),
          ),

        ],
      ),
    );


  }

  //selector de filtro ciudad
  Widget _ciudad(BuildContext context){
    return MyStatefulWidget();
  }

}