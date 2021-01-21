//https://medium.com/@maffan/how-to-fetch-data-using-api-calls-in-flutter-99668a60170c

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lista_usuarios/models/rutaUsuario.dart';

class UserList extends StatelessWidget{

  final String apiUrl = "http://10.0.2.2:8080/rutaUsuario/getAllByRutaId/5fe08c5fcb547a43a444398c";

  Future<List<dynamic>> fetchUsers() async {
    print("a por los datos");
    var result = await http.get(apiUrl);//pide los datos
     if (result.statusCode == 200){
      var responseJson = json.decode(result.body);
      return responseJson;
    } else {
      return null;
    }
 
  }


  void cogerUsuarios(){
    print("metodo recogida de RANKING");
   
    var usuarios =[];

    FutureBuilder<List<dynamic>>(
      future: fetchUsers(),//recoge los datos
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("snapshot $snapshot");

        if(snapshot.hasData){//si hay datos

          List<dynamic> ld;
          for(int i = 0; i<10;i++){
            usuarios[i]=RutaUsuario(i, snapshot.data[i]['puntuacion']);//creamos el candidato*/

            ld.add(usuarios[i]);
          }
          print('Usuarios ' + usuarios.toString());
          
        }
      }
    );
    //return usuarios;
    print(usuarios.length);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EL RANKING '),
      ),
      body: 
      Stack(children: 
      [
        //boton de volver 
        Positioned(
              top: 5,
              left: 5,
              child: Container(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.black,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
            
            ),
          ),
          //ranking
          Align(
              child: Column(
                children: [
                  Container(//titulo
                    decoration: 
                      new BoxDecoration(
                        color: Color.fromRGBO(136,212,152,1),
                        boxShadow: 
                        [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),  
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                    width: 310,
                    height: 100,
                    child: Center(
                      child:
                      Text(
                      'RANKING',
                      /*style: 
                      GoogleFonts.pressStart2p(
                        fontStyle: FontStyle.italic, 
                        fontSize: 40, 
                        foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Color.fromRGBO(243,233,210,1), 
                      ),*/
                      ),
                    )
                  ),
                ],
              ),
          
            ),
      
          Container(
            margin: const EdgeInsets.only(top: 200.0),
            child: FutureBuilder<List<dynamic>>(
              future: fetchUsers(),//recoge los datos
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                
                if(snapshot.hasData){//si hay datos
                  
                  return ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: snapshot.data.length,//el tamaño del json (elementos)
                    itemBuilder: (BuildContext context, int index){
                    
                      return Container(
                        child: Center(
                          child:
                          Text((index+1).toString()+"º " + snapshot.data[index]['id'].toString() + " " + snapshot.data[index]['puntuacion'].toString(),)//style: GoogleFonts.pressStart2p(fontStyle: FontStyle.italic, fontSize: 25, color: Color.fromRGBO(136,212,152,1))),
                        
                      ));
                      
                      });
                }else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
      ],)
    );
  }

}