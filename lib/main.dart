import 'package:flutter/material.dart';
import 'package:jobjenius/nomain.dart';
import 'package:jobjenius/seguridad.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import 'utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logg.dart'; // Asegúrate de importar la página principal

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const LoginWidget());
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            appColor.azul,
            Color.fromARGB(207, 2, 48, 94),
            Color.fromARGB(223, 3, 41, 80),
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: FadeAnimatedWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'JobGenius',
                            style: Utils.poppins(40, FontWeight.w700, Colors.white),
                          ),
                          Text(
                            'Bienvenidos',
                            style: Utils.poppins(20, FontWeight.normal, Colors.white),
                          )
                        ],
                      ),
                      Image.asset('assets/Logo.png', width: 100, height: 100,)
                    ]
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: appColor.fondo,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "Usuario o celular",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "Contraseña",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40,),
                            const Text('¿Olvidaste tu contraseña?', style: TextStyle(color: Colors.grey),),
                            const SizedBox(height: 40,),
                            GestureDetector(
                              onTap: () {
                                 navigatorKey.currentState?.push(
                                  MaterialPageRoute(builder: (context) => const Main()),
                                );
                                
                              },
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: appColor.azul,
                                ),
                                child: Center(
                                  child: Text(
                                    'Iniciar Sesión',
                                    style: Utils.poppins(18, FontWeight.w700, Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
