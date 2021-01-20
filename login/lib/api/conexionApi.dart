import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

//const baseUrl = "http://10.10.12.115:8080/";//pc Josu
const baseUrl = "http://10.0.2.2:8080/"; //10.0.2.2 porque estas en un emulador de android

class API {
  static Future getUsers() async{
    var url = baseUrl + "usuarios/getAll";
    final response = await http.get(url);
    if (response.statusCode == 200){
      var responseJson = json.decode(response.body);
      return responseJson;
    } else {
      return null;
    }
  }

  static Future createUser(var data) async{
    var url = baseUrl + "/usuarios/new";
    
    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"}, 
      body: body
    );

    print("${response.statusCode}");
    print("${response.body}");
    
    print("Funcion de crear usuario");
  }

  static Future getUser(var user) async{
    var url = baseUrl + "/usuarios/getUsuario/$user";
    final response = await http.get(url);
    if (response.statusCode == 200){
      var responseJson = json.decode(response.body);
      return responseJson;
    } else {
      return null;
    }
  }

  static Future getRutas() async{
    print("EN COGER RUTAS");
    var url = baseUrl + "rutas/getAll";
    final response = await http.get(url);
    if (response.statusCode == 200){
      var responseJson = json.decode(response.body);
      return responseJson;
    } else {
      return null;
    }
  }
}