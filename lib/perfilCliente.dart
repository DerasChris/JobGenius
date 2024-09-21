import 'package:flutter/material.dart';
import 'package:jobjenius/utils/utils.dart';
import 'theme/app_color.dart';

class Perfilcliente extends StatefulWidget {
	const Perfilcliente({super.key});

	@override
  State<Perfilcliente> createState() => _Perfilcliente();

}

void main() {
  runApp(const Perfilcliente());
}

class _Perfilcliente extends State<Perfilcliente>{
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
                    padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Center(
                      child: Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2.5, color: Colors.white)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'chris.jpg', 
                            width: 50,
                          ),
                        )
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
                      //height: 100, 
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
                                  )
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