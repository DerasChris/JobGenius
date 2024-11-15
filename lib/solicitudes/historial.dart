import 'package:flutter/material.dart';
import 'package:jobjenius/APISERVICE/trabajador/post_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/service.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/utils/utils.dart';

class Historial extends StatefulWidget {
  const Historial({super.key});

  @override
  State<Historial> createState() => _HistorialState();

  
}

class _HistorialState extends State<Historial> {

@override
   void initState() {
    super.initState();
    _loadSolicitudes(); 
  }


  List<Post> solicitudes = []; 
  bool isLoading = true; 

  

 Future<void> _loadSolicitudes() async {
    try {
      List<Post> solicitudesList = await getSolicitudes("64b5f67a7a1f4625b9e8b001"); // Llamada al servicio
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
      ),
      body: 
      isLoading
      ?const Center(child: CircularProgressIndicator())
        :Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: solicitudes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            'Descripción: '+solicitudes[index].descripcionProblema,
                            style: Utils.poppins(14, FontWeight.w700, Colors.black),
                          ),
                          subtitle: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fecha: '+solicitudes[index].fecha,
                                    style: Utils.poppins(12, FontWeight.w700, Colors.black),
                                  ),
                                  Text(
                                    'Urgencia: '+solicitudes[index].nivelUrgencia,
                                    style: Utils.poppins(12, FontWeight.w700, Colors.black),
                                  ),
                                  Text(
                                    'Estado: '+solicitudes[index].estado,
                                    style: Utils.poppins(12, FontWeight.w700, Colors.black),
                                  ),
                                  Text(
                                    'Presupuesto estimado : \$'+solicitudes[index].presupuesto.toString(),
                                    style: Utils.poppins(12, FontWeight.w700, Colors.black),
                                  ),
                                ],
                              ),
                            ),

                           ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                solicitudes[index].fotosProblema,
                                width: 100,
                                height: 100,
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

                            ],
                          )
                        ),
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
