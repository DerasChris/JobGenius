import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/extensions/SafeNavigationExtension.dart';
import 'package:jobjenius/theme/app_color.dart';

class SecondCvScreen extends StatefulWidget {
  const SecondCvScreen({super.key});

  @override
  _SecondCvScreenState createState() => _SecondCvScreenState();
}

class _SecondCvScreenState extends State<SecondCvScreen> {
  bool? respVehiculo;
  bool? respViaje;
  int? respInicio;
  TextEditingController nivelEstudio = TextEditingController();
  TextEditingController contacto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.safeNavigateBack(),
        ),
        title: Text(
          'Mi Curriculum Vitae',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 25),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('¿Posee Vehiculo Propio?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 0, 51, 102),
                )),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: respVehiculo,
                  onChanged: (value) {
                    setState(() {
                      respVehiculo = value;
                    });
                  },
                ),
                Text('Sí',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                Radio<bool>(
                  value: false,
                  groupValue: respVehiculo,
                  onChanged: (value) {
                    setState(() {
                      respVehiculo = value;
                    });
                  },
                ),
                Text('No',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Text('¿Posee Disponibilidad de Viaje?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 0, 51, 102),
                )),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: respViaje,
                  onChanged: (value) {
                    setState(() {
                      respViaje = value;
                    });
                  },
                ),
                Text('Sí',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                Radio<bool>(
                  value: false,
                  groupValue: respViaje,
                  onChanged: (value) {
                    setState(() {
                      respViaje = value;
                    });
                  },
                ),
                Text('No',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Disponibilidad de Inicio',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 0, 51, 102),
              ),
            ),
            Row(
              children: [
                Radio<int>(
                  value: 1,
                  groupValue: respInicio,
                  onChanged: (value) {
                    setState(() {
                      respInicio = value;
                    });
                  },
                ),
                Text('Inmediata',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                Radio<int>(
                  value: 2,
                  groupValue: respInicio,
                  onChanged: (value) {
                    setState(() {
                      respInicio = value;
                    });
                  },
                ),
                Text('Parcial',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nivelEstudio,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Nivel de Estudio",
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 51, 102),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {},
                  )),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contacto,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Contacto",
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 51, 102),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {
                      //Logica para activar el reconocimiento de voz
                    },
                  )),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes implementar la lógica para guardar las respuestas
                  print('Respuesta 1: $respVehiculo');
                  print('Respuesta 2: $respViaje');
                  print('Respuesta 3: $respInicio');
                  print('Respuesta 4: ${nivelEstudio.text}');
                  print('Respuesta 5: ${contacto.text}');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.amarillo,
                    foregroundColor: appColor.azul,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12)),
                child: Text('Guardar Curriculum Vitae',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 0, 51, 102),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
