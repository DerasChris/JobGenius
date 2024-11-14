import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobjenius/nomain.dart';
import 'package:jobjenius/seguridad.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import 'utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logg.dart'; 
import 'package:jobjenius/nuevoUsuario.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NuevoUsuarioState> newUserKey = GlobalKey<NuevoUsuarioState>();
final FirebaseAuth _auth = FirebaseAuth.instance;

/* void main() {
  runApp(const LoginWidget());
} */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDEWxo6kUkiZeDCoh6tbvSMuuY_NlJnD_0",
      appId: "1:326741051548:android:0a5f0957fc2f7b373e4559",
      messagingSenderId: "2014753903439475296",
      projectId: "jobgenius-52418",
    ),
  );
}


class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            appColor.azul,
            const Color.fromARGB(207, 2, 48, 94),
            const Color.fromARGB(223, 3, 41, 80),
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
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
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(
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
                              child: TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
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
                              child: TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
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
                              onTap: ()  async {
                                try {
                                  final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                  navigatorKey.currentState?.push(
                                    MaterialPageRoute(builder: (context) => const Main()),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('Usuario no Encontrado.');
                                  } else if (e.code == 'wrong-password') {
                                    print('Contraseña erronea.');
                                  }
                                }
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
                            const SizedBox(height: 40,),
                            GestureDetector(
                              onTap: () async {
                                try {
                                  final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                  navigatorKey.currentState?.push(
                                    MaterialPageRoute(builder: (context) => const Main()),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print('Ya existe una cuenta con este correo.');
                                  }
                                }
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
                                    'Crear Cuenta',
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
