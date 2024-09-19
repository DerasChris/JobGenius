import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_color.dart';

import 'package:jobjenius/widgets/CatWidget.dart';


class DetalleTrabajador extends StatefulWidget {
	const DetalleTrabajador({super.key});

	@override
  State<DetalleTrabajador> createState() => _DetalleTrabajador();

}

void main() {
  runApp(const DetalleTrabajador());
}

class _DetalleTrabajador extends State<DetalleTrabajador>{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor.azul,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 80, left: 25, right: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.arrow_back, color: Colors.white,),
                              Text(
                                'Detalle del Trabajador',
                                style: TextStyle( color:Colors.white)
                              ),
                            ],
                        ),
                      ],
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2.5, color: Colors.white)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'armando_casas.jpg', 
                          width: 50,
                        ),
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipOval(
                          child: Icon(Icons.favorite, color: appColor.azul),
                        ),
                        const Text(
                          '150+',
                          style: TextStyle( color:Colors.white)
                        ),
                        const Text('Trabajos Hechos', style: TextStyle( color:Colors.white))
                      ],
                    ),
                    
                  ),
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      )
                    ), 
                    //height: 100, 
                    child: Column(
                      children: [
                        Text("Contactar"),
                        Container(
                          child: CategoriaWidget(),
                        ),
                      ]
                    )
                ),
              ],
          ),
        ),
      ),
    );    
  }
}