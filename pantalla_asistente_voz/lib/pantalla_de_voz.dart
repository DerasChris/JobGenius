import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class PantallaDeVoz extends StatefulWidget {
  const PantallaDeVoz({super.key});

  @override
  PantallaDeVozState createState() => PantallaDeVozState();
}

class PantallaDeVozState extends State<PantallaDeVoz> {
  String text = "Mantener presionado el botón para comenzar a hablar";
  var _isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
         title: const Text(
          'Asistente de Voz',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 51, 102),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 51, 102),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 130.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 51, 102),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Center(
          child: AvatarGlow(
            endRadius: 60.0,
            animate: _isListening,
            glowColor: Colors.yellow,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            repeatPauseDuration: const Duration(milliseconds: 100),
            showTwoGlows: true,
            child: Material(
              elevation: 8.0,
              shape: const CircleBorder(),
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    _isListening = true;
                    text = "Escuchando...";
                  });
                },
                onTapUp: (details) {
                  setState(() {
                    _isListening = false;
                    text = "Mantener presionado el botón para comenzar a hablar";
                  });
                },
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
