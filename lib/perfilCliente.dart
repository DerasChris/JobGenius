import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_service.dart';
import 'package:jobjenius/main.dart';
import 'package:jobjenius/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme/app_color.dart';

class Perfilcliente extends StatefulWidget {
	const Perfilcliente({super.key});

	@override
  State<Perfilcliente> createState() => _Perfilcliente();

}



class _Perfilcliente extends State<Perfilcliente>{

  @override
  void initState() {
    super.initState();
    _loadusuario(); 
  }
  
   void _onLogout() {
      navigatorKey.currentState!.pop();

  }

    Future<void> deleteUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('firebaseUID')) {
      await prefs.remove('firebaseUID');
    }
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
    print(uid);
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
        backgroundColor: appColor.azul,
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Row(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: appColor.fondo,
                                    shape: BoxShape.rectangle, 
                                    borderRadius: BorderRadius.circular(19),
                                  ),
                                  child: const ClipOval(
                                    child: Icon(
                                      Icons.arrow_back, color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Perfil Usuario',
                                  style: Utils.poppins(20, FontWeight.normal, Colors.white),
                                ),
                              ),
                              
                            ],
                        ),
                      ],
                    ),
                  ),
                  isLoading
              ?Center(child: CircularProgressIndicator())
          :Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Center(
                      child: Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2.5, color: Colors.white)
                        ),
                        child: ClipOval(
                      child: Image.network(
                        datosuser.single.url,
                        width: 80,
                        height: 140,
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
                      ),
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color: Color(0xF2F2F2F2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        )
                      ), 
                      height: MediaQuery.of(context).size.height*0.7, 
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Christian Deras",
                                    style: Utils.poppins(20, FontWeight.w600, Colors.black)
                                  ),
                                  Text(
                                    "chrisderas14@gmail.com",
                                    style: Utils.poppins(12, FontWeight.normal, Colors.black)
                                  ),
                                  
                                ]
                              ), 
                            ),
                            Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: appColor.amarillo,
                                                    shape: BoxShape.circle, 
                                                  ),
                                                  child: ClipOval(
                                                    child: Icon(
                                                      Icons.person, 
                                                      color: appColor.azul,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25, right: 25),
                                                child: Text(
                                                  'Editar Perfil', 
                                                  style: Utils.poppins(15, FontWeight.normal, appColor.azul)
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios, 
                                                  color: appColor.azul,
                                                ),
                                              ),
                                            ],
                                          ),
                                    
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: appColor.amarillo,
                                                    shape: BoxShape.circle, 
                                                  ),
                                                  child: ClipOval(
                                                    child: Icon(
                                                      Icons.notifications, 
                                                      color: appColor.azul,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15, right: 15),
                                                child: Text(
                                                  'Notificaciones', 
                                                  style: Utils.poppins(15, FontWeight.normal, appColor.azul)
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios, 
                                                  color: appColor.azul,
                                                ),
                                              ),
                                            ],
                                          ),
                                    
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: appColor.amarillo,
                                                    shape: BoxShape.circle, 
                                                  ),
                                                  child: ClipOval(
                                                    child: Icon(
                                                      Icons.translate, 
                                                      color: appColor.azul,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 40, right: 40),
                                                child: Text(
                                                  'Idioma', 
                                                  style: Utils.poppins(15, FontWeight.normal, appColor.azul)
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios, 
                                                  color: appColor.azul,
                                                ),
                                              ),
                                            ],
                                          ),
                                    
                                        )
                                      ],
                                      
                                    ),
                                    
                                  ),
                                 GestureDetector(
                                  onTap: () async {
                                    try {
                                          // Limpiar el estado de sesión
                                          deleteUID();
                                          await FirebaseAuth.instance.signOut();

                                    _onLogout();

                                        } catch (e) {
                                          print('Error al cerrar sesión: $e');
                                          // Mostrar un mensaje de error al usuario
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Error al cerrar sesión: $e'),
                                            ),
                                          );
                                        }

                                  },
                                   child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: appColor.amarillo,
                                                      shape: BoxShape.circle, 
                                                    ),
                                                    child: ClipOval(
                                                      child: Icon(
                                                        Icons.logout, 
                                                        color: appColor.azul,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                                  child: Text(
                                                    'Cerrar sesión', 
                                                    style: Utils.poppins(15, FontWeight.normal, appColor.azul)
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios, 
                                                    color: appColor.azul,
                                                  ),
                                                ),
                                              ],
                                            ),
                                      
                                          )
                                        ],
                                        
                                      ),
                                      
                                    ),
                                 ),
                                ],
                            )
                          ]
                        ),
                      )
                  ),
                ],
            ),
          ),
        ),
    ); 
  }
}