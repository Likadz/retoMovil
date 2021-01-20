
  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lista_usuarios/models/candidatos.dart';

class ListadoUsuarios{
  final String apiUrl = "https://randomuser.me/api/?results=10&nat=ES";

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
            usuarios[i]=Candidato(i, snapshot.data[i]['name']['first'], CircleAvatar(radius: 30,backgroundImage: NetworkImage(snapshot.data[i]['picture']['large'])));//creamos el candidato*/
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