import 'dart:ui';

import 'package:flutter/material.dart';

class Favorito{
  String id;
  String nombre;
  int votos=0;
  CircleAvatar foto;
  
  Favorito(this.id, this.nombre, this.foto);
}