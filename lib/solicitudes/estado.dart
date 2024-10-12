import 'package:flutter/material.dart';

class EstadoSolicitudes extends StatefulWidget {
  const EstadoSolicitudes({super.key});

  @override
  State<EstadoSolicitudes> createState() => _EstadoSolicitudesState();
}

class _EstadoSolicitudesState extends State<EstadoSolicitudes> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estados"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Aquí van tus estados de solicitud"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text("Regresar"),
            ),
          ],
        ),
      ),
    );
  }
}