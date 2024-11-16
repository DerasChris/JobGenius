import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobjenius/frontendSolicitantes/feedTrabajos.dart';
import 'package:jobjenius/frontendSolicitantes/navegacionSolicitantes.dart';

/* 
Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Main());
}
 */

class TrabajadoresLog extends StatelessWidget {
  const TrabajadoresLog({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationSolicitantes(),
    );
  }
}