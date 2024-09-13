import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Trabajadoreswidget extends StatelessWidget {
  const Trabajadoreswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: _list.length,
        padding: const EdgeInsets.only(left: 25,right: 5),
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.only(left: 10, right: 0, top: 11),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  height: 140.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                    color: _list[index].color,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column( //columna de texto
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _list[index].text,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Text(
                              _list[index].descripcion,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Image.asset('assets/${_list[index].imagen}'),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          );
        } ,
      ),
    );
  }
}

class StyleModel {
  final int id;
  final Color color;
  final List<BoxShadow> boxShadow;
  final String text;
  final String descripcion;
  final String imagen;

  StyleModel({required this.id, required this.color, required this.boxShadow, required this.text, required this.descripcion, required this.imagen});
}

List<StyleModel> _list = [
  StyleModel(
    id: 1,
    color: Color.fromARGB(255, 0, 51, 102),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: '¿Buscas un albañil confiable \ncinco estrellas?',
    descripcion: 'David Francisco Peres Alido \nAlbañil y Maestro de obras',
    imagen: 'persona.png'
  ),
  StyleModel(
    id: 2,
    color: Color.fromARGB(255, 0, 51, 102),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Carlos turcios',
    descripcion: 'Plomero',
    imagen: 'image 16.png'
  ),
  StyleModel(
    id: 3,
    color: Color.fromARGB(255, 0, 51, 102),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'José madiel',
    descripcion: 'Mecanico',
    imagen: 'image 17.png'
  ),
];