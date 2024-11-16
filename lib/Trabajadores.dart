import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_service.dart';
import 'package:jobjenius/widgets/CatWidget.dart';
import 'package:jobjenius/widgets/SearchBarWidget.dart';
import 'package:jobjenius/widgets/TrabajadoresWidget.dart';
import 'package:jobjenius/widgets/lista.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModuloInicio extends StatefulWidget {
  const ModuloInicio({super.key});

  @override
  State<ModuloInicio> createState() => _ModuloInicioState();
}

class _ModuloInicioState extends State<ModuloInicio> {
   @override
  void initState() {
    super.initState();
    _loadusuario(); 
  }
List<Usuario> datosuser = []; 
bool isLoading = true;

Future<String?> getUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('firebaseUID');
} 




  
Future<void> _loadusuario() async {
  try {
     final String? uid = await getUID();
    final datosregistro = await datosUsuario(uid!); // Llamada al servicio de usuarios
    setState(() {
      datosuser = [datosregistro];
      isLoading = false;  // Cambiar el estado de carga después de que los datos estén listos


    });
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    print('Error al cargar los datos: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xF2F2F2F2),
        body: SingleChildScrollView(
          child: 
          isLoading
              ?Center(child: CircularProgressIndicator())
          :Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        datosuser.single.url,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                         loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                            : null,
                                      ),
                                    );
                                  }
                                },
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                         'Hey, ' + datosuser.single.nombreCompleto.split(' ')[0] + ' !',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 25),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Comencemos..',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 20),
                              fontWeight: FontWeight.w600),
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
                child: const CategoriaWidget(),
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
              const Trabajadoreswidget(),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
