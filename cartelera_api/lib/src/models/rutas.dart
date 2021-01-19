class Rutas {

  List<Ruta> items = new List();

  Rutas();

  Rutas.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final rutas = new Ruta.fromJsonMap(item);
      items.add( rutas );
    }

  }

}
class Ruta {
  String id;
  String nombre;
  String ciudad;
  String tematica;
  int duracion;
  String descripcion;
  String transporte;
  String imagen;
  int dificultad;

  Ruta({
    this.id,
    this.nombre,
    this.ciudad,
    this.tematica,
    this.duracion,
    this.descripcion,
    this.transporte,
    this.imagen,
    this.dificultad
  });

  Ruta.fromJsonMap( Map<String, dynamic> json ) {

    id      = json['id'];
    nombre   = json['nombre'];
    ciudad    = json['ciudad'];
    tematica      = json['tematica'];
    duracion          = json['duracion'];
    descripcion        = json['descripcion'];
    transporte       = json['transporte'];
    imagen = json['imagen'];
    dificultad = json['dificultad'];
  }

}
