import 'dart:ui';

import 'package:flutter/material.dart';

class Candidato{
  int id;
  String nombre;
  int votos=0;
  CircleAvatar foto;
  
  Candidato(this.id, this.nombre, this.foto);
}