import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/informacion.dart';
import 'package:peliculas/src/pages/ranking.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buscador.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

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
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return CardSwiper( peliculas: snapshot.data );
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
    /*String dropdownValue = 'Ciudad';
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
       /* setState(() {
          dropdownValue = newValue;
        });*/
      },
      items: <String>['Ciudad', 'Irun', 'Donostia', 'Iruña']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );*/


  }

}