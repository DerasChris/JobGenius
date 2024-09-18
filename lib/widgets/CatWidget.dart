import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriaWidget extends StatelessWidget {
  const CategoriaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: _list.length,
        padding: const EdgeInsets.only(left: 5,right: 5),
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.only(left: 10, right: 0, top: 11),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: _list[index].color,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset('assets/${_list[index].imagen}'),
                ),
                Text(
                  _list[index].text,
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
  final String imagen;

  StyleModel({required this.id, required this.color, required this.boxShadow, required this.text, required this.imagen});
}

List<StyleModel> _list = [
  StyleModel(
    id: 1,
    color: Color.fromARGB(255, 242, 245, 248),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Agricultor',
    imagen: 'image 18.png'
  ),
  StyleModel(
    id: 2,
    color: Color.fromARGB(255, 242, 245, 248),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Artesanos',
    imagen: 'image 22.png'
  ),
  StyleModel(
    id: 3,
    color: Color.fromARGB(255, 242, 245, 248),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Electricistas',
    imagen: 'image 21.png'
  ),
  StyleModel(
    id: 4,
    color: Color.fromARGB(255, 242, 245, 248),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Zapatero',
    imagen: 'image 20.png'
  ),
  StyleModel(
    id: 5,
    color: Color.fromARGB(255, 242, 245, 248),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Panadero',
    imagen: 'image 19.png'
  ),
  StyleModel(
    id: 6,
    color: Color.fromARGB(255, 242, 245, 248),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Panadero',
    imagen: 'image 22.png'
  ),
  StyleModel(
    id: 7,
    color: Color.fromARGB(255, 242, 245, 248),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Panadero',
    imagen: 'image 22.png'
  ),
  StyleModel(
    id: 8,
    color: Color.fromARGB(255, 242, 245, 248),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'Panadero',
    imagen: 'image 22.png'
  )
];