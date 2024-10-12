import 'package:flutter/material.dart';
import 'package:jobjenius/frontendSolicitantes/feedTrabajos.dart';


void main() {
  runApp(const Main());
}


class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaDeTrabajos(),
    );
  }
}