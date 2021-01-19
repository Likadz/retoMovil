import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';


class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(17,75,95,1),
      body: Stack(
        
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children : [
          Positioned(
              top: 5,
              left: 5,
              child: Container(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.black,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
            
            ),
          ),
          Positioned.fill(
            top: 80,
            child: Align(
              child: Column(
                children: [
                  Container(
                    decoration: 
                      new BoxDecoration(
                        color: Color.fromRGBO(136,212,152,1),
                        boxShadow: 
                        [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),  
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                    width: 310,
                    height: 100,
                    child: Center(
                      child:
                      Text(
                      'RANKING',
                      style:
                        GoogleFonts.pressStart2p(
                          fontStyle: FontStyle.italic, 
                          fontSize: 40, 
                          foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Color.fromRGBO(243,233,210,1), 
                        ) 
                      ),
                    )
                  ),
                  Spacer(),
                  Text('1ST AAAAA 1000',style: GoogleFonts.pressStart2p(fontStyle: FontStyle.italic, fontSize: 25, color: Color.fromRGBO(136,212,152,1))),
                  
                  Spacer(),
                  Text('2ST BBBBB 900',style: GoogleFonts.pressStart2p(fontStyle: FontStyle.italic, fontSize: 25, color: Color.fromRGBO(136,212,152,1))),
                  
                  Spacer(),
                  Text('3ST CCCC 700',style: GoogleFonts.pressStart2p(fontStyle: FontStyle.italic, fontSize: 25, color: Color.fromRGBO(136,212,152,1))),
                  
                  Spacer(),
                  Text('4ST DDD 450',style: GoogleFonts.pressStart2p(fontStyle: FontStyle.italic, fontSize: 25, color: Color.fromRGBO(136,212,152,1))),
                  Spacer(),
                  Text('5ST EEE 250',style: GoogleFonts.pressStart2p(fontStyle: FontStyle.italic, fontSize: 25, color: Color.fromRGBO(136,212,152,1))),
                  Spacer()
                ],
              ),
          
            ),
          ),
        ] 

      ),
    );
  }
}