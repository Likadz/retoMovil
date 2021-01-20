import 'package:flutter/material.dart';
import 'package:peliculas/src/models/rutas.dart';
import 'package:peliculas/src/pages/informacion.dart';
import 'package:peliculas/src/pages/rankingApi.dart';
import 'package:peliculas/src/providers/rutas_provider.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buscador.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class HomePage extends StatelessWidget {
  var listadoRutas;
  final String apiUrl = "http://10.0.2.2:8080/rutas/getAll";

  Future<List<dynamic>> fetchRutas() async {
    print("a por las rutas");
    var result = await http.get(apiUrl);//pide los datos
    if (result.statusCode == 200){
      var responseJson = json.decode(result.body);
      print("TODAS LAS RUTAS " + responseJson.toString());
      return responseJson;
    } else {
      return null;
    }
 
  }

 
  void cogerRutas(){
    print("metodo recogida de rutas");
   
    var usuarios =[];

    FutureBuilder<List<dynamic>>(
      future: fetchRutas(),//recoge los datos
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("snapshot $snapshot");

        if(snapshot.hasData){//si hay datos

          List<dynamic> ld;
          for(int i = 0; i<10;i++){
            usuarios[i]=Ruta(i.toString());//creamos el candidato*/

            ld.add(usuarios[i]);
          }
          print('Usuarios ' + usuarios.toString());
          
        }
      }
    );
    //return usuarios;
    print(usuarios.length);
  }

  //final rutasProvider = new RutasProvider();
  //var lista;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(17,75,95,1),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _ciudad(context),
            _swiperTarjetas(context),
            _footer(context)
          ],
        ),
      )
       
    );
  }

  Widget _swiperTarjetas(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      child: FutureBuilder<List<dynamic>>(
        future: fetchRutas(),//recoge los datos
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          
          if(snapshot.hasData){//si hay datos
            
            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: snapshot.data.length,//el tamaño del json (elementos)
              itemBuilder: (BuildContext context, int index){
              
                return Container(
                  child: Center(
                    child:
                    Text(snapshot.data[index]['id'].toString() + " " + snapshot.data[index]['nombre'].toString(),style: GoogleFonts.pressStart2p(fontStyle: FontStyle.italic, fontSize: 25, color: Color.fromRGBO(136,212,152,1))),
                  
                  ));
                
                });
          }else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
   /* RutasProvider.getRutas().then((response) {
      lista = response;
      
      print("LISTA USUARIOS " + lista.toString());
    });
    return CardSwiper( rutas: lista );
  */
    /*
    var listadoRutas;
    RutasProvider.getRutas().then((response) {
      print('Respuesta rutas ' + response.toString());
      listadoRutas=response;
    
      print("Listado de rutas " + listadoRutas.toString());
      
      return CardSwiper( Rutas: listadoRutas );
        
    });*/


    /*return FutureBuilder(
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
    );*/
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
                    MaterialPageRoute(builder: (context) => RankingApiPage()),
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