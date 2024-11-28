import 'package:flutter/material.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_service.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/APISERVICE/trabajador/post_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/service.dart';
import 'package:jobjenius/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaDeTrabajos extends StatefulWidget {
  const PaginaDeTrabajos({super.key});

  @override
  _PaginaDeTrabajosState createState() => _PaginaDeTrabajosState();
}

class _PaginaDeTrabajosState extends State<PaginaDeTrabajos> {
  double _imageSize = 150.0;


  @override
   void initState() {
    super.initState();
    _loadSolicitudesT(); 
  }


  List<Post> solicitudes = []; 
  List<Usuario>? solicitante = []; 
  bool isLoading = true; 


  Future<String?> getUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('firebaseUID');
  }  

  Future<void> _loadSolicitudesT() async {
    try {
      final String? uid = await getUID();
      List<Post> solicitudesList = await getSolicitudesTrab(uid!); // Llamada al servicio
      setState(() {
        solicitudes = solicitudesList;
        isLoading = false; // Detener la carga una vez que los datos se han obtenido
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error al cargar las categorías: $e');
      print(solicitudes);
    }
  }

    Future<void> _loadTrabajador(String id) async {
    try {

    final solicitantesList = await datosUsuario(id); // Llamada al servicio
      setState(() {
        solicitante = [solicitantesList];
        isLoading = false; // Detener la carga una vez que los datos se han obtenido
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error al cargar las categorías: $e');
      print(solicitudes);
    }
  }


  String etiquetaSeleccionada = 'Todos';
 Future<void> _showMyDialog(Post solicitud) async {
      await _loadTrabajador(solicitud.usuarioId);
      return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Detalles del Trabajo',
                      textAlign: TextAlign.center,
                      style: Utils.poppins(24, FontWeight.w700, Colors.black),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildInfoRow('Usuario ID:', solicitud.usuarioId),
                  _buildInfoRow('Trabajador ID:', solicitud.trabajadorId),
                  _buildInfoRow('Tipo de Trabajo:', solicitud.tipoTrabajo),
                  _buildInfoRow('Descripción:', solicitud.descripcionProblema),
                  _buildInfoRow('Nivel de Urgencia:', solicitud.nivelUrgencia),
                  _buildInfoRow('Hora:', solicitud.hora),
                  _buildInfoRow('Fecha:', solicitud.fecha),
                  _buildInfoRow('Presupuesto:', '\$${solicitud.presupuesto}'),
                  _buildInfoRow('Estado:', solicitud.estado),
                  SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          _imageSize = 160.0; 
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          _imageSize = 80.0; 
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: _imageSize,
                        height: _imageSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            solicitud.fotosProblema,
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
                    ),
                  ),
                  SizedBox(height: 16),
                  isLoading
                    ? CircularProgressIndicator()
                    : (solicitante != null && solicitante!.isNotEmpty)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoRow('Nombre Completo:', solicitante![0].nombreCompleto),
                              _buildInfoRow('Teléfono:', solicitante![0].telefono),
                              _buildInfoRow('Correo:', solicitante![0].email),
                            ],
                          )
                        : Text('No se encontraron datos del solicitante.'),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Cancelar',
                          style: Utils.poppins(18, FontWeight.w600, appColor.amarillo),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Aceptar',
                          style: Utils.poppins(18, FontWeight.w600, appColor.azul),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }



void _toggleImageSize(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Image.network(imageUrl, fit: BoxFit.cover),
      );
    },
  );
}

Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: Utils.poppins(18, FontWeight.w600, Colors.black),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: Utils.poppins(18, FontWeight.normal, Colors.black),
          ),
        ),
      ],
    ),
  );
}


  
  @override
  Widget build(BuildContext context) {
    /* List<Map<String, String>> trabajosFiltrados = (etiquetaSeleccionada == 'Todos'
        ? solicitudes
        : solicitudes.where((solicitudes) => solicitudes.tipoTrabajo == etiquetaSeleccionada).toList()).cast<Map<String, String>>(); */

    return Scaffold(
      backgroundColor: appColor.fondo, 
      appBar: AppBar(
        backgroundColor: appColor.fondo, 
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Trabajos disponibles',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
         
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: appColor.fondo, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: solicitudes.length,
                  itemBuilder: (BuildContext context, int index) {
                    //final trabajo = trabajosFiltrados[index];
                    return Card(
                      color: appColor.azul, 
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), 
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              solicitudes[index].tipoTrabajo,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              solicitudes[index].descripcionProblema,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                _showMyDialog(solicitudes[index]);
                                
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appColor.amarillo, 
                                foregroundColor: Colors.black, 
                              ),
                              child: const Text('Contactar'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}