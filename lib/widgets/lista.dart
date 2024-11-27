import 'package:flutter/material.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_service.dart';
import 'package:jobjenius/detalleTrabajador.dart';
import 'package:jobjenius/theme/app_color.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({super.key});

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  List<Usuario> trabajadores = []; // Lista que contendrá los trabajadores
  bool isLoading = true; // Para saber si los datos están cargando

  @override
  void initState() {
    super.initState();
    _loadTrabajadores(); // Cargar los trabajadores cuando el widget se inicializa
  }

  // Método para cargar los trabajadores desde el servicio
  Future<void> _loadTrabajadores() async {
    try {
      List<Usuario> trabajadoresList = await getUser(); // Llamada al servicio
      setState(() {
        trabajadores = trabajadoresList;
        isLoading = false; // Detener la carga una vez que los datos se han obtenido
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error al cargar los trabajadores: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
     isLoading
          ? const Center(child: CircularProgressIndicator()) // Mostrar cargando
          :
    SizedBox(
      height: 160,
      child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: trabajadores.length,
              padding: const EdgeInsets.only(left: 15, right: 15),
              itemBuilder: (BuildContext context, int index) {
                final trabajador = trabajadores[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleTrabajador(
                          trabajador: trabajador.firebaseUID, // Pasar trabajador específico
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15, top: 11),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: appColor.azul, // Color de fondo si la imagen no está disponible
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                        trabajador.url,
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
                          ),
                        ),
                        Text(
                          trabajador.nombreCompleto, 
                        ),
                        Text(
                          trabajador.telefono, 
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
