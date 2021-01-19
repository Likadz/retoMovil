
  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lista_usuarios/models/candidatos.dart';
import 'package:lista_usuarios/models/rutaUsuario.dart';

class ListadoUsuarios{
  final String apiUrl = "http://localhost:8080/rutaUsuario/getAllByRutaId/5fe1af96be240f162762eac7";

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(apiUrl);//pide los datos
    //print(json.decode(result.body)['results']);
    return json.decode(result.body)['results'];//devuelve el json a partir del results

  }


  void cogerUsuarios(){
    var usuarios =[];
    print("COGER USUARIOS");
    
    FutureBuilder<List<dynamic>>(
      future: fetchUsers(),//recoge los datos
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot);
        if(snapshot.hasData){//si hay datos
          for(int i = 0; i<10;i++){
            usuarios[i]=RutaUsuario(snapshot.data[i]['id'], snapshot.data[i]['usuario_id'], snapshot.data[i]['ruta_id'], snapshot.data[i]['puntuacion']);//creamos el candidato*/
          }
          print(usuarios);
          return null;
        }
        
        return Center(child: CircularProgressIndicator());
      }
          
    );
    //return usuarios;
  }

}