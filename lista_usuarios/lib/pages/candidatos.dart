

import 'package:flutter/material.dart';
import 'package:lista_usuarios/listadoUsuarios.dart';
import 'package:lista_usuarios/user-list.dart';

class Candidatos extends StatefulWidget{
Candidatos({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Candidatos createState() => _Candidatos();
}

class _Candidatos extends State<Candidatos> { 
  @override
  Widget build(BuildContext context) {
    Widget usuarios = UserList();
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(5),//padding general alrededor
        crossAxisSpacing: 4.0,  
        mainAxisSpacing: 8.0,  
        crossAxisCount:6,
         children:[
           /*for(int i = 0 ; i< usuarios.length; i++)
             usuarios[i]*/
           
        ] 
     
      ),
      
    );
  }
}