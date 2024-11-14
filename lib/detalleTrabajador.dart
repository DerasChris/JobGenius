import 'package:flutter/material.dart';
import 'package:jobjenius/APISERVICE/trabajador/trabajador_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/trabajador_service.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_service.dart';
import 'package:jobjenius/SolicitudTrabajo.dart';
import 'package:jobjenius/solicitudes/nuevaSolicitud.dart';
import 'package:jobjenius/utils/utils.dart';
import 'theme/app_color.dart';

class DetalleTrabajador extends StatefulWidget {
  final String trabajador;

	const DetalleTrabajador({super.key, required this.trabajador});

	@override
  State<DetalleTrabajador> createState() => _DetalleTrabajador();

}


class _DetalleTrabajador extends State<DetalleTrabajador>{


 @override
  void initState() {
    super.initState();
    _loadTrabajador(); 
  }

List<Usuario> usuarioTrabajador = []; 
List<Trabajador> trabajadores = []; 
bool isLoading = true;

Future<void> _loadTrabajador() async {
  try {
    final trabajadoresList = await getUser(); // Llamada al servicio de usuarios
    final detalle = await getTrabajadores(); // Llamada al servicio de trabajadores

    List<Usuario> usuariosFiltrados = trabajadoresList.where((usuario) => usuario.firebaseUID == widget.trabajador).toList();
    List<Trabajador> trabajadoresFiltrados = detalle.where((trab) => trab.usuarioId == widget.trabajador).toList();

    setState(() {
      usuarioTrabajador = usuariosFiltrados;
      trabajadores = trabajadoresFiltrados;
      isLoading = false;  // Cambiar el estado de carga después de que los datos estén listos


    });
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    print('Error al cargar los datos: $e');
  }
}




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      PopScope(
        canPop: false,
        child: 
        Scaffold(
          appBar: AppBar(
            title: Text('Detalle trabajador ${widget.trabajador}'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: appColor.azul,
          body: 
          isLoading
          ?Center(child: CircularProgressIndicator()) 
          :Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        
                       
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
                                child: Image.network(
                                usuarioTrabajador.single.url,
                                width: 100,
                                height: 200,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                            : null,
                                      ),
                                    );
                                  }
                                },
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
                                        trabajadores.single.cantidadTrabajosRealizados.toString()+' +',
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
                                        trabajadores.single.aniosExperiencia.toString()+' años',
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
                                        trabajadores.single.calificacion.toString(),
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
                                          usuarioTrabajador.single.nombreCompleto,
                                          style: Utils.poppins(20, FontWeight.w600, Colors.black)
                                        ),
                                        Text(
                                          'Profesión: '+trabajadores.single.profesion,
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
                                          trabajadores.single.curriculum,
                                          style: Utils.poppins(20, FontWeight.normal, Colors.black)
                                        ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Text(
                                        trabajadores.single.descripcion,
                                        textAlign: TextAlign.center,
                                        style: Utils.poppins(14, FontWeight.normal, const Color.fromRGBO(0, 0, 0, 0.604)),
                                      ),
                                  ),
                                  Text('Categorias',
                                  textAlign: TextAlign.left,
                                        style: Utils.poppins(18, FontWeight.bold, const Color.fromRGBO(0, 0, 0, 0.604)),
                                  ),
                                  Padding(        padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      spacing: 5, // Espacio horizontal entre las tarjetas
                                      runSpacing: 8, // Espacio vertical entre las filas de tarjetas
                                      children: trabajadores.single.categorias.map((categoria) {
                                        return Container(
                                          width: 120, // Divide el ancho disponible entre 3
                                          child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  categoria,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  /* Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: ElevatedButton(
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
                                  ), */
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
                                                'assets/usuario_a.jpg',
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
                      onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Nuevasolicitud(trabajador: widget.trabajador,),
                                    ),
                                  );
                                },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ), backgroundColor: appColor.amarillo,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15
                        ), 
                      ), 
                      child: Text(
                        "Solicitar Servicio",
                        style: Utils.poppins(18, FontWeight.w500, appColor.azul),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );    
  }
}