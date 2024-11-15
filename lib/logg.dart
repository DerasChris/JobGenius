import 'package:flutter/material.dart';
import 'package:jobjenius/navegacion.dart';



class ClientesLog extends StatelessWidget {
  const ClientesLog({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigation(),
    );
  }
}