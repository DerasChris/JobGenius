import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/extensions/SafeNavigationExtension.dart';
import 'package:jobjenius/theme/app_color.dart';

class TrustedContactScreen extends StatefulWidget {
  const TrustedContactScreen({super.key});

  @override
  _TrustedContactScreenState createState() => _TrustedContactScreenState();
}

class _TrustedContactScreenState extends State<TrustedContactScreen> {
  List<String> contactos = ['Juan Pérez', 'María García', 'Carlos López'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF2F2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.safeNavigateBack(),
        ),
        title: Text(
          'Contactos de Seguridad',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20, color: Colors.black),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tus contactos de confianza',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 18),
                fontWeight: FontWeight.w600,
                color: appColor.azul,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: contactos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: appColor.azul,
                        foregroundColor: Colors.white,
                        child: const Icon(Icons.person),
                      ),
                      title: Text(
                        contactos[index],
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            contactos.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogoAgregarContacto();
        },
        child: const Icon(Icons.add),
        backgroundColor: appColor.amarillo,
      ),
    );
  }

  void _mostrarDialogoAgregarContacto() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String nuevoContacto = '';
        return AlertDialog(
          title: Text('Agregar nuevo contacto', style: GoogleFonts.poppins()),
          content: TextField(
            onChanged: (value) {
              nuevoContacto = value;
            },
            decoration: const InputDecoration(hintText: "Nombre del contacto"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar', style: GoogleFonts.poppins()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Agregar', style: GoogleFonts.poppins()),
              onPressed: () {
                if (nuevoContacto.isNotEmpty) {
                  setState(() {
                    contactos.add(nuevoContacto);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
