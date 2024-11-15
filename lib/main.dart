import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_service.dart';
import 'package:jobjenius/logg.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'frontendSolicitantes/startpage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
  runApp(const LoginWidget());
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool isNewUser = false;  // Para manejar el estado del checkbox
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nombreCompletoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _rolController = TextEditingController();
  final _urlController = TextEditingController();
  final picker = ImagePicker();
  File? _image;
   String _imageUrl ="";
   String rol="";

     Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        await _uploadImage(pickedFile);
      } else {
        print('No image selected.');
      }
    });
  }


   void _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      SnackBar(content: Text('Debes ingresar campos validos'),);
      return;
    }

    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Obtener el UID del usuario
      final String uid = userCredential.user?.uid ?? '';
      if (uid.isNotEmpty) {
        // Guardar el UID en SharedPreferences
        await saveUID(uid);

        // Navegar a la nueva pantalla (ejemplo: HomeScreen)
         navigatorKey.currentState!.push(
                                        MaterialPageRoute(builder: (context) => const ClientesLog()),
                                      );
      } else {
        print("No se pudo obtener el UID del usuario.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Usuario no encontrado.');
      } else if (e.code == 'wrong-password') {
        print('Contraseña errónea.');
      } else {
        print('Error: ${e.message}');
      }
    }
  }

  Future<void> saveUID(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firebaseUID', uid);
  } 
  

   Future<void> _uploadImage(XFile file) async {
    try {
      // Crear una referencia a Firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Subir el archivo a Firebase Storage
      UploadTask uploadTask = ref.putFile(
        File(file.path),
      );

      // Esperar a que se complete la carga
      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

      // Obtener la URL de la imagen cargada
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _imageUrl = downloadUrl;
      });

      print('Imagen cargada con éxito, URL: $downloadUrl');
    } catch (e) {
      print('Error al cargar la imagen: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
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
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(20),
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
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(  // Agregar SingleChildScrollView
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
                          const SizedBox(height: 60),
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
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
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
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "Contraseña",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text('¿Olvidaste tu contraseña?', style: TextStyle(color: Colors.grey)),
                              const SizedBox(height: 40),
                              GestureDetector(
                                onTap: () async {
                                  _login();
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
                              const SizedBox(height: 40),
                              // Checkbox para mostrar campos de nuevo usuario
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: appColor.amarillo,
                                    activeColor: appColor.azul,
                                    value: isNewUser,
                                    onChanged: (value) {
                                      setState(() {
                                        isNewUser = value ?? false;
                                      });
                                    },
                                  ),
                                  const Text('Crear Nuevo Usuario')
                                ],
                              ),
                              // Mostrar los campos solo si isNewUser es verdadero
                              if (isNewUser) ...[
                                TextField(
                                  controller: _nombreCompletoController,
                                  decoration: const InputDecoration(labelText: 'Nombre Completo'),
                                ),
                                TextField(
                                  controller: _telefonoController,
                                  decoration: const InputDecoration(labelText: 'Teléfono'),
                                ),
                                TextField(
                                  controller: _ubicacionController,
                                  decoration: const InputDecoration(labelText: 'Ubicación'),
                                ),
                                Column(
                                  children: [
                                    DropdownButtonFormField<String>(
                                      value: rol.isNotEmpty ? rol : null,
                                      items: [
                                        DropdownMenuItem(
                                            value: 'cliente',
                                            child: Text('Cliente')),
                                        DropdownMenuItem(
                                            value: 'trabajador',
                                            child: Text('Trabajador')),
                                      ],
                                      decoration: InputDecoration(
                                          floatingLabelStyle: TextStyle(
                                              color: appColor.azul,
                                              fontSize:
                                                  18), // Color de la etiqueta cuando se eleva
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: appColor.azul,
                                                width:
                                                    2.0), // Borde cuando está seleccionado (focado)
                                          ),
                                          labelText:
                                              'Rol'),
                                      onChanged: (value) {
                                        setState(() {
                                          rol = value!;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor selecciona el rol';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                Text('Agregue su foto:'),
                                    _image == null
                                        ? Text('No se ha seleccionado imagen.')
                                        : Image.file(
                                            _image!,
                                            fit: BoxFit.contain,
                                          ),
                                    ElevatedButton(
                                      onPressed: _pickImage,
                                      child: Text('Subir foto'),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: appColor.azul,
                                          textStyle: Utils.poppins(14, FontWeight.bold, Colors.white),
                                          foregroundColor: Colors.white),
                                    ),
                              ],
                              const SizedBox(height: 40),
                              GestureDetector(
                                onTap: () async {
                                  if (isNewUser) {
                                    if (_emailController.text.isEmpty || _passwordController.text.isEmpty ||
                                        _nombreCompletoController.text.isEmpty || _telefonoController.text.isEmpty) {
                                      print('Todos los campos son obligatorios.');
                                      return;
                                    }
                                    try {
                                      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                      final String firebaseUID = userCredential.user?.uid ?? '';
                                      final  userData = Usuario(
                                        id: "",
                                        firebaseUID: firebaseUID,
                                        nombreCompleto: _nombreCompletoController.text,
                                        email: _emailController.text,
                                        telefono: _telefonoController.text,
                                        ubicacion: _ubicacionController.text,
                                        fechaRegistro: DateTime.now(),
                                        rol: rol,
                                        favoritos: ['Usuario'],
                                        url: _imageUrl
                              );
                                      try {
                                      // Llamar al servicio para crear el post
                                      final result = await createUser(userData);
                                      print('Formulario enviado: $result');
                                      saveUID(firebaseUID);
                                      // Puedes mostrar un mensaje de éxito o navegar a otra pantalla
                                    
                                      navigatorKey.currentState!.push(
                                        MaterialPageRoute(builder: (context) => const ClientesLog()),
                                      );
     

                                    } catch (error) {
                                      print('Error al enviar el formulario: $error');
                                      // Muestra un mensaje de error
                                    }

                                    } on FirebaseAuthException catch (e) {
                                      print(e.message);
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
                                      'Confirmar',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
