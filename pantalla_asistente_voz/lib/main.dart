import 'package:flutter/material.dart';
import 'pantalla_de_voz.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PantallaDeVoz(),
        );
  }
}
