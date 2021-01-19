//https://medium.com/@maffan/how-to-fetch-data-using-api-calls-in-flutter-99668a60170c

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lista_usuarios/models/rutaUsuario.dart';

class UserList extends StatelessWidget{

  final String apiUrl = "http://10.0.2.2:8080/rutas/getAll";

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(apiUrl);//pide los datos
    return json.decode(result.body)['results'];//devuelve el json a partir del results

  }

  //atributo nombre, le pasamos el elemento del json que toque y accedemos a los parametros del nombre
  String _name(dynamic user){
    return user['id'];

  }

  void cogerUsuarios(){
    print("metodo recogida de usuarios");
   
    var usuarios =[];

    FutureBuilder<List<dynamic>>(
      future: fetchUsers(),//recoge los datos
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("snapshot $snapshot");

        if(snapshot.hasData){//si hay datos

          List<dynamic> ld;
          for(int i = 0; i<10;i++){
            usuarios[i]=RutaUsuario(snapshot.data[i]['id'], snapshot.data[i]['usuario_id'], snapshot.data[i]['ruta_id'], snapshot.data[i]['puntuacion']);//creamos el candidato*/
            ld.add(usuarios[i]);
          }
          print(usuarios);
          
        }
      }
    );
    //return usuarios;
    print(usuarios.length);
  }


  @override
  Widget build(BuildContext context) {
    var usuarios=[];
    int _voto=0;
    return Scaffold(
      appBar: AppBar(
        title: Text('RANKING'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),//recoge los datos
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){//si hay datos
              
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,//el tamaño del json (elementos)
                itemBuilder: (BuildContext context, int index){
                  usuarios.add(
                    new RutaUsuario(
                      index.toString(),
                      _name(snapshot.data[index]), 
                      _name(snapshot.data[index]), 
                      1000, 
                     // CircleAvatar(radius: 30,backgroundImage: NetworkImage(snapshot.data[index]['picture']['large']))
                    )
                  );
                  return Container(
                    height: 50.0,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      //foto de avatar
                      Text(_name(snapshot.data[index])),//pasamos a la funcion del nombre el elemento 
                      Row(
                        children: [
                          Text('0'),
                          IconButton(
                            icon: Icon(Icons.favorite),
                            tooltip: 'vota al usuario',
                            onPressed: () {
                              _voto+=1;
                              print(_voto);
                            },
                          ),
                        ],
                      )
                    ],
                  ));
                  
                  });
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },


        ),
      ),
    );
  }

}