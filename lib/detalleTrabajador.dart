import 'package:flutter/material.dart';
import 'package:jobjenius/utils/utils.dart';
import 'theme/app_color.dart';

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
        body: Column(
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                          child: Row(
                            children: <Widget>[
                              Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: appColor.fondo,
                                          shape: BoxShape.rectangle, 
                                          borderRadius: BorderRadius.circular(19),
                                        ),
                                        child: const ClipOval(
                                          child: Icon(
                                            Icons.arrow_back, color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 70,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Detalle del Trabajador',
                                          style: Utils.poppins(20, FontWeight.normal, Colors.white),
                                        ),
                                      ],
                                    )
              
                                  ],
                              ),
                            ],
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: Container(
                            width: 150.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2.5, color: Colors.white)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'armando_casas_1.jpg', 
                                width: 50,
                              ),
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: appColor.amarillo,
                                        shape: BoxShape.circle, 
                                      ),
                                      child: ClipOval(
                                        child: Icon(
                                          Icons.favorite, 
                                          color: appColor.azul,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '150+',
                                      style: Utils.poppins(20, FontWeight.bold, Colors.white)
                                    ),
                                    Text(
                                      'Trabajos Hechos', 
                                      style: Utils.poppins(10, FontWeight.normal, Colors.white)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: appColor.amarillo,
                                          shape: BoxShape.circle, 
                                        ),
                                        child: ClipOval(
                                          child: Icon(
                                            Icons.emoji_events, 
                                            color: appColor.azul,
                                          ),
                                        ),
                                      ),
                                    Text(
                                      '30 años',
                                      style: Utils.poppins(20, FontWeight.bold, Colors.white)
                                    ),
                                    Text(
                                      'Experiencia', 
                                      style: Utils.poppins(10, FontWeight.normal, Colors.white)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: appColor.amarillo,
                                        shape: BoxShape.circle, 
                                      ),
                                      child: ClipOval(
                                        child: Icon(
                                          Icons.star, 
                                          color: appColor.azul,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '  4.9  ',
                                      style: Utils.poppins(20, FontWeight.bold, Colors.white)
                                    ),
                                    Text(
                                      ' Rating ', 
                                      style: Utils.poppins(10, FontWeight.normal, Colors.white)
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            color: Color(0xF2F2F2F2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            )
                          ), 
                          //height: 100, 
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Armando Casas",
                                        style: Utils.poppins(20, FontWeight.w600, Colors.black)
                                      ),
                                      Text(
                                        "Albañil",
                                        style: Utils.poppins(12, FontWeight.normal, Colors.black)
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Icon(
                                              Icons.star, 
                                              color: appColor.amarillo,
                                            ),
                                            Icon(
                                              Icons.star, 
                                              color: appColor.amarillo,
                                            ),
                                            Icon(
                                              Icons.star, 
                                              color: appColor.amarillo,
                                            ),
                                            Icon(
                                              Icons.star, 
                                              color: appColor.amarillo,
                                            ),
                                            Icon(
                                              Icons.star, 
                                              color: appColor.amarillo,
                                            ),
                                        ],
                                      ),
                                    ]
                                  ), 
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "A cerca de mi trabajo: ",
                                        style: Utils.poppins(20, FontWeight.normal, Colors.black)
                                      ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Text(
                                      "\"Soy Armando Casas, albañil desde hace 25 años. "
                                      "He trabajado en numerosos proyectos, desde pequeñas "
                                      "remodelaciones hasta la construcción de edificios de "
                                      "varios pisos. Soy muy responsable. Me gusta asegurarme "
                                      "de que cada detalle quede perfecto, cumpliendo con las "
                                      "normas de seguridad y calidad. Llevo con orgullo mi "
                                      "profesión y me encantan los retos que implica cada nuevo proyecto. \"",
                                      textAlign: TextAlign.center,
                                      style: Utils.poppins(14, FontWeight.normal, const Color.fromRGBO(0, 0, 0, 0.604)),
                                    ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    ), backgroundColor: appColor.amarillo,
                                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15), 
                                  ), 
                                  child: Text(
                                      "Contactar",
                                      style: Utils.poppins(18, FontWeight.w500, appColor.azul),
                                    ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Comentarios Recientes",
                                        style: Utils.poppins(18, FontWeight.normal, Colors.black)
                                      ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'usuario_a.jpg',
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.star, 
                                          color: appColor.amarillo,
                                        ),
                                        Icon(
                                          Icons.star, 
                                          color: appColor.amarillo,
                                        ),
                                        Icon(
                                          Icons.star, 
                                          color: appColor.amarillo,
                                        ),
                                        Icon(
                                          Icons.star, 
                                          color: appColor.amarillo,
                                        ),
                                        Icon(
                                          Icons.star, 
                                          color: appColor.amarillo,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              "Hace 2 días",
                                              textAlign: TextAlign.right,
                                              style: Utils.poppins(12, FontWeight.normal, Colors.grey)
                                            ),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60, bottom: 10),
                                      child: Text(
                                          "Este maestro de obra es un máquina, de verdad. Domina todo lo de construcción al 100%. Y lo mejor es que siempre mantuvo todo super limpio y ordenado, ni parecía que había una obra en mi casa. Avanzó rapidísimo con el trabajo, sin bajar para nada la calidad. Si necesitas algo de construcción o remodelación, definitivamente te lo recomiendo. Hace un trabajo de 10 y es un gran tipo. ¡Lo máximo!",
                                          textAlign: TextAlign.left,
                                          style: Utils.poppins(13, FontWeight.normal, Colors.black),
                                        ),
                                    ),
                                  ],
                                ),
                              ]
                            ),
                          )
                      ),
                    ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xF2F2F2F2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 40, right: 40),
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ), backgroundColor: appColor.amarillo,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 15
                      ), 
                    ), 
                    child: Text(
                      "Realizar Comentario",
                      style: Utils.poppins(18, FontWeight.w500, appColor.azul),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );    
  }
}