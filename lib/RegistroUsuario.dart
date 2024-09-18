import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: RegistroUsuario(),
  ));
}

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});

  @override
  RegistroUsuarioState createState() => RegistroUsuarioState();
}

class RegistroUsuarioState extends State<RegistroUsuario> {
  bool _isAnimating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Acción al presionar la flecha de retroceso
              },
            ),
            const Text(
              'Registro de Usuario',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 0, 51, 102),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xF2F2F2F2),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mi Curriculum Vitae',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Edad',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Género',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Selecciona tu oficio',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              maxLines: 6,
              decoration: InputDecoration(
                labelText: 'Describe tu experiencia',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 90),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 193, 7),
                  foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 130.0,
                    vertical: 18.0,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                     fontWeight: FontWeight.bold, 
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                 child: const Text(
                  'Información Adicional',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis, // Asegura que el texto no se divida en varias líneas
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 193, 7),
                  foregroundColor: const Color.fromARGB(255, 7, 7, 7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 125.0,
                    vertical: 18.0,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Letra en negritas
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  'Guardar Currículum Vitae',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 51, 102),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isAnimating = !_isAnimating;
              });
            },
            child: AvatarGlow(
              animate: _isAnimating,
              glowColor: const Color.fromARGB(255, 255, 193, 7),
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              child: Material(
                elevation: 8.0,
                shape: const CircleBorder(),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 193, 7),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Icon(
                    Icons.mic,
                    color: Color.fromARGB(255, 0, 51, 102),
                    size: 40.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
