import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobjenius/detalleTrabajador.dart';
import 'package:jobjenius/main.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: GestureDetector(
         onTap: () {
          navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (context) => const DetalleTrabajador()),
          );
        },
        child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: _list.length,
          padding: const EdgeInsets.only(left: 15,right: 15),
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.only(left: 10, right: 15, top: 11),
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: _list[index].color,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset('assets/${_list[index].imagen}'),
                  ),
                  Text(
                    _list[index].text,
                  ),
                  Text(
                    _list[index].profesion
                  )
                ],
              ),
            );
          } ,
        ),
      ),
    );
  }
}


class StyleModel {
  final int id;
  final Color color;
  final List<BoxShadow> boxShadow;
  final String text;
  final String profesion;
  final String imagen;

  StyleModel({required this.id, required this.color, required this.boxShadow, required this.text, required this.profesion, required this.imagen});
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
    text: 'José Queza',
    profesion: 'Obrero',
    imagen: 'image 15.png'
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
    profesion: 'Plomero',
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
    profesion: 'Mecanico',
    imagen: 'image 17.png'
  ),
  StyleModel(
    id: 4,
    color: Color.fromARGB(255, 0, 51, 102),
     boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
    ],
    text: 'José Queza',
    profesion: 'Mecanico',
    imagen: 'image 15.png'
  )
  
];