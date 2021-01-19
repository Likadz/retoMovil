
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:peliculas/src/models/rutas.dart';

const baseUrl = "http://10.0.2.2:8080/"; //10.0.2.2 porque estas en un emulador de android
class RutasProvider {
  static Future getRutas() async{
    var url = baseUrl + "usuarios/getAll";
    final response = await http.get(url);
    if (response.statusCode == 200){
      var responseJson = json.decode(response.body);
      return responseJson;
    } else {
      return null;
    }
  }

  String _url = 'http://10.0.2.2:8080/rutas';


  Future<List<Ruta>> _procesarRespuesta(Uri url) async {
    print('procesar respuesta');
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    print(resp.body);
    final rutas = new Rutas.fromJsonList(decodedData['results']);


    return rutas.items;
  }

  Future<List<Ruta>> getRutas() async {
    print("aer si pilla las cosas " );
    final url = Uri.http(_url,'/getAll');
  
    return await _procesarRespuesta(url);

  }

}

