import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/extensions/SafeNavigationExtension.dart';
import 'package:jobjenius/theme/app_color.dart';
// import 'package:geolocator/geolocator.dart'; //descargar dependencia
// import 'package:url_launcher/url_launcher.dart'; //descargar dependencia

class EmergencyContactScreen extends StatefulWidget {
  const EmergencyContactScreen({super.key});

  @override
  _EmergencyContactScreenState createState() => _EmergencyContactScreenState();
}

class _EmergencyContactScreenState extends State<EmergencyContactScreen> {
  final String _ubicacionActual = 'Obteniendo ubicación...';

  // @override
  // void initState() {
  //   super.initState();
  //   _obtenerUbicacion();
  // }

  // Future<void> _obtenerUbicacion() async {
  //   try {
  //     Position posicion = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //     setState(() {
  //       _ubicacionActual =
  //           'Latitud: ${posicion.latitude}, Longitud: ${posicion.longitude}';
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _ubicacionActual = 'Error al obtener la ubicación';
  //     });
  //   }
  // }

  // Future<void> _llamarEmergencia() async {
  //   const url = 'tel:911'; // Número de emergencia
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'No se pudo realizar la llamada $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.safeNavigateBack(),
        ),
        title: Text(
          'Emergencia',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 25),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: appColor.amarillo,
                  foregroundColor: appColor.azul,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              child: Text('Llamar a Emergencia',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 51, 102),
                  )),
            ),
            const SizedBox(height: 20),
            Text('Tu Ubicacion Actual:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: appColor.azul,
                )),
            const SizedBox(height: 10),
            Text(_ubicacionActual,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
