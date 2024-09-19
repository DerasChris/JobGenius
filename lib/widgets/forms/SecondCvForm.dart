import 'package:flutter/material.dart';
import 'package:jobjenius/extensions/SafeNavigationExtension.dart';
import 'package:jobjenius/theme/app_color.dart';

class SecondCvForm extends StatefulWidget {
  const SecondCvForm({super.key});

  @override
  _SecondCvFormState createState() => _SecondCvFormState();
}

class _SecondCvFormState extends State<SecondCvForm> {
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
        title: const Text('Mi Curriculum Vitae'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('¿Posee Vehiculo Propio?'),
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
                const Text('Sí'),
                Radio<bool>(
                  value: false,
                  groupValue: respVehiculo,
                  onChanged: (value) {
                    setState(() {
                      respVehiculo = value;
                    });
                  },
                ),
                const Text('No'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('¿Posee Disponibilidad de Viaje?'),
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
                const Text('Sí'),
                Radio<bool>(
                  value: false,
                  groupValue: respViaje,
                  onChanged: (value) {
                    setState(() {
                      respViaje = value;
                    });
                  },
                ),
                const Text('No'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Disponibilidad de Inicio'),
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
                const Text('Inmediata'),
                Radio<int>(
                  value: 2,
                  groupValue: respInicio,
                  onChanged: (value) {
                    setState(() {
                      respInicio = value;
                    });
                  },
                ),
                const Text('Parcial'),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nivelEstudio,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Nivel de Estudio",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {
                      //Logica para activar el reconocimiento de voz
                    },
                  )),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contacto,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Contacto",
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
                child: const Text('Guardar Curriculum Vitae'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
