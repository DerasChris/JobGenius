import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/extensions/SafeNavigationExtension.dart';
// import 'package:jobjenius/extensions/VoiceRecognitionExtension.dart';
import 'package:jobjenius/theme/app_color.dart';

class SecurityProblemForm extends StatefulWidget {
  const SecurityProblemForm({super.key});

  @override
  _SecurityProblemFormState createState() => _SecurityProblemFormState();
}

class _SecurityProblemFormState extends State<SecurityProblemForm> {
  DateTime _fecha = DateTime.now();
  String _tipoIncidente = 'Seleccione el tipo de incidente';
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _ubicacion = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();

  final List<String> _tiposIncidentes = [
    'Seleccione el tipo de incidente',
    'Acoso',
    'Comportamiento agresivo',
    'Violación de protocolos de seguridad',
    'Uso indebido de equipo',
    'Otro'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.safeNavigateBack(),
        ),
        title: Text(
          'Reporte de Seguridad',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 25),
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Nombre del Trabajador",
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: appColor.azul,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {},
                  )),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Ubicacion del Incidente",
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: appColor.azul,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {},
                  )),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _tipoIncidente,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Tipo de Incidente',
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: appColor.azul,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {},
                  )),
              items: _tiposIncidentes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      )),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _tipoIncidente = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Descripción del Incidente",
                alignLabelWithHint:
                    true, // Alinea la etiqueta con el texto de sugerencia
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: appColor.azul,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {},
                ),
              ),
              maxLines: 3, // Aumenta el número de líneas visibles
              textAlignVertical:
                  TextAlignVertical.top, // Alinea el texto en la parte superior
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text("Fecha del Incidente",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: appColor.azul,
                  )),
              subtitle: Text("${_fecha.toLocal()}".split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _fecha,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (picked != null && picked != _fecha)
                  setState(() {
                    _fecha = picked;
                  });
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.amarillo,
                    foregroundColor: appColor.azul,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12)),
                child: Text('Enviar Reporte',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 0, 51, 102),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
