import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/utils/utils.dart';
import 'package:jobjenius/widgets/SearchBarWidget.dart';

class BusquedaTabajadores extends StatefulWidget {
  const BusquedaTabajadores({super.key});

  @override
  State<BusquedaTabajadores> createState() => _BusquedaTabajadoresState();
}



class _BusquedaTabajadoresState extends State<BusquedaTabajadores> {

  void openFilterDialog() async {
    await FilterListDialog.display<Categorias>(
       
      context,
      listData: categorias,
      selectedListData: categorias,
      choiceChipLabel: (categorias) => categorias!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (categorias, query) {
        return categorias.name!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          categorias = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.fondo,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Busqueda de trabajadores',
                style: Utils.poppins(18, FontWeight.w700, Colors.black),
              ),
            ),
            SizedBox(height: 20,),
            const Center(
              child: SearchBarWidget(),
            ),
            Center(child: Container(
              child: GestureDetector(
                onTap: () {
                  openFilterDialog();
                },
                child: Icon(Icons.filter_alt,size: 30,)),
              )
              ),
            Expanded(
              child: ListView.builder(
                itemCount: _busqueda.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset('assets/${_busqueda[index].imagen}',width: 60,height: 60, fit: BoxFit.cover,),
                      title: Text(_busqueda[index].text,style: Utils.poppins(14, FontWeight.w700, Colors.black),),
                      subtitle: Text(_busqueda[index].profesion,style: Utils.poppins(12, FontWeight.w700, Colors.black),),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


class Busquedas {
  final int id;
  final Color color;
  final List<BoxShadow> boxShadow;
  final String text;
  final String profesion;
  final String imagen;

  Busquedas({required this.id, required this.color, required this.boxShadow, required this.text, required this.profesion, required this.imagen});
}

List<Busquedas> _busqueda = [
Busquedas(
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
 Busquedas(
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
  Busquedas(
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
  Busquedas(
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
  ),
   Busquedas(
    id: 5,
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
  ),
   Busquedas(
    id: 6,
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
  ,
   Busquedas(
    id: 7,
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

class Categorias {
  final String? name;
  final String? avatar;
  Categorias({this.name, this.avatar});
}

List<Categorias> categorias = [
  Categorias(name: "Fontanero", avatar: ""),
  Categorias(name: "Electricista", avatar: ""),
  Categorias(name: "Maestro de obra", avatar: ""),
  Categorias(name: "Carpintero", avatar: ""),
  Categorias(name: "Pintor", avatar: ""),
  Categorias(name: "Soldador", avatar: ""),
  Categorias(name: "Albañil", avatar: ""),
  Categorias(name: "Jardinero", avatar: ""),
  Categorias(name: "Cerrajero", avatar: ""),
  Categorias(name: "Herrero", avatar: ""),
  Categorias(name: "Mecánico", avatar: ""),
  Categorias(name: "Vidriero", avatar: ""),
  Categorias(name: "Tapicero", avatar: ""),
];

