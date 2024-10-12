import 'package:flutter/material.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/utils/utils.dart';

class Historial extends StatefulWidget {
  const Historial({super.key});

  @override
  State<Historial> createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _busqueda.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.history
                        ),
                        title: Text(
                          _busqueda[index].trabajo,
                          style: Utils.poppins(14, FontWeight.w700, Colors.black),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _busqueda[index].fechaSolicitada,
                              style: Utils.poppins(12, FontWeight.w700, Colors.black),
                            ),
                             Text(
                              _busqueda[index].aprobada ? "Estado: Aprobada": "Estado: Pendiente",
                              style: Utils.poppins(12, FontWeight.w700, Colors.black),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.remove_red_eye_rounded),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Historiales {
  final int id;
  final Color color;
  final List<BoxShadow> boxShadow;
  final String trabajo;
  final String fechaSolicitada;
  final bool aprobada;
  final String descripcion;


  Historiales(
      {required this.id,
      required this.color,
      required this.boxShadow,
      required this.trabajo,
      required this.fechaSolicitada,
      required this.aprobada,
      required this.descripcion,
      });
}

List<Historiales> _busqueda = [
  Historiales(
      id: 1,
      color: appColor.azul,
      boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
      ],
      trabajo: "Cambio de chapa de puerta",
      fechaSolicitada: "12/12/2024 5:00",
      aprobada: true,
      descripcion: "Chapa en mal estado por el uso",
  ),
  Historiales(
      id: 2,
      color: appColor.azul,
      boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
      ],
      trabajo: "Minjitorio tapado",
      fechaSolicitada: "12/12/2024 5:00",
      aprobada: true,
      descripcion: "Minjitorio en mal estado por el uso",
  ),
  Historiales(
      id: 3,
      color: appColor.azul,
      boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
      ],
      trabajo: "Cambio de cerradura de puerta",
      fechaSolicitada: "12/12/2024 5:00",
      aprobada: true,
      descripcion: "Chapa en mal estado por el uso",
  ),
  Historiales(
      id: 4,
      color: appColor.azul,
      boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 5.0,
        spreadRadius: 9.00,
        offset: Offset(3.0,5.8)
      )
      ],
      trabajo: "Cambio de chapa de puerta",
      fechaSolicitada: "12/12/2024 5:00",
      aprobada: true,
      descripcion: "Chapa en mal estado por el uso",
  ),
];
