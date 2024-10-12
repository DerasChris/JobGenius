import 'package:flutter/material.dart';
import 'package:jobjenius/solicitudes/estado.dart';
import 'package:jobjenius/solicitudes/favoritos.dart';
import 'package:jobjenius/solicitudes/historial.dart';
import 'package:jobjenius/solicitudes/nuevaSolicitud.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/utils/utils.dart';

class SolicitudTrabajo extends StatefulWidget {
  const SolicitudTrabajo({super.key});

  @override
  State<SolicitudTrabajo> createState() => _SolicitudTrabajoState();
}

class _SolicitudTrabajoState extends State<SolicitudTrabajo> {
  List<SolicitudesCard> solicitudesCard = [
    SolicitudesCard(Icons.history,"Historial de solicitudes",true,Historial()),
    SolicitudesCard(Icons.add,"Nueva solicitud",false,Nuevasolicitud()),
    SolicitudesCard(Icons.favorite,"Favoritos",false,Favoritos()),
    SolicitudesCard(Icons.assessment,"Estado de solicitudes",false,EstadoSolicitudes()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
        child: Column(
          children: [
            Center(
              child: Text(
                "Solicitud de trabajo",
                style: Utils.poppins(20, FontWeight.bold, Colors.black),
                ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                children: 
                  solicitudesCard.map((e) => GestureDetector(
                    onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => e.screen),
                    );
                  },
                    child: Card(
                      elevation: 2.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              e.icon,
                              size: 50,
                              color: Colors.white,
                              ),
                            SizedBox(height: 10,),
                            Text(
                              e.title,
                              style: Utils.poppins(12, FontWeight.normal, Colors.white),
                              )
                          ]
                        ),
                        color: appColor.azul,
                      ),
                  )
                  ).toList()
              )
            )
          ],
        ),
      ),
    );
  }
}

class SolicitudesCard {
  final IconData icon;
  final String title;
  bool isActive = false;
  final Widget screen;

  SolicitudesCard(this.icon,this.title,this.isActive,this.screen);
}