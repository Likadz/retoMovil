import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/rutas.dart';


class CardSwiper extends StatelessWidget {
  
  final List<dynamic> rutas;
 
  CardSwiper({ @required this.rutas });

  
  @override
  Widget build(BuildContext context) {
    var i=0;
    for(Ruta ruta in rutas){
      print(ruta);
      i++;
    }
    final _screenSize = MediaQuery.of(context).size;

    return Container(
       padding: EdgeInsets.only(top: 10.0),
       child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context, int index){

            rutas[index].id = '${ rutas[index].id }-tarjeta';

            return Hero(
              tag: rutas[index].id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: ()=> Navigator.pushNamed(context, 'detalle', arguments: rutas[index]),
                  child: FadeInImage(
                    image: NetworkImage( '../resources/imagen.jpg'  ),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                )
              ),
            );
            
          },
          itemCount: i,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
      ),
    );

  }
}
