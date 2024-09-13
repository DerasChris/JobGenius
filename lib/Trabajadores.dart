import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/widgets/CatWidget.dart';
import 'package:jobjenius/widgets/SearchBarWidget.dart';
import 'package:jobjenius/widgets/TrabajadoresWidget.dart';
import 'package:jobjenius/widgets/lista.dart';

class ModuloInicio extends StatefulWidget {
  const ModuloInicio({super.key});

  @override
  State<ModuloInicio> createState() => _ModuloInicioState();
}

void main() {
  runApp(const ModuloInicio());
}

class _ModuloInicioState extends State<ModuloInicio> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xF2F2F2F2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      'assets/chris.jpg',
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 25,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hey, Christian.',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 30),
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          'Comencemos..',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 20),
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 25, right: 25),
              child: SearchBarWidget(),
            ),
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25),
                  child: Text(
                    'Trabajadores Destacados',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const ListItemWidget(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 25),
                  child: Text(
                    'Categorias',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Container(
              child: CategoriaWidget(),
            ),
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 25),
                  child: Text(
                    'Trabajadores Disponibles',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const Trabajadoreswidget()
          ],
        ),
      ),
    );
  }
}