import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/extensions/SafeTextExtension.dart';
import 'package:jobjenius/widgets/forms/SecurityProblemForm.dart';
import 'package:jobjenius/widgets/screens/EmergencyContactScreen.dart';
import 'package:jobjenius/widgets/screens/TrustedContactScreen.dart';

class Seguridad extends StatelessWidget {
  const Seguridad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF2F2F2F2),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Seguridad',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 25),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            _buildClickableRow(
              context,
              icon: Icons.report_gmailerrorred_outlined,
              title: 'Reporta un problema de seguridad',
              subtitle: 'Reporta un problema de seguridad con el trabajador',
              onTap: () => _navigateToScreen(context, 'ReportarProblema'),
            ),
            const SizedBox(height: 35),
            _buildClickableRow(
              context,
              icon: Icons.phone_in_talk_outlined,
              title: 'Llamada al 911',
              subtitle:
                  'Contacta al 911 y comparte tu ubicación con las autoridades en caso de emergencia',
              onTap: () => _navigateToScreen(context, 'Llamada911'),
            ),
            const SizedBox(height: 35),
            _buildClickableRow(
              context,
              icon: Icons.lock,
              title: 'Añade contactos de seguridad',
              subtitle:
                  'Agrega un grupo de contactos de confianza para notificar cuando has contratado un servicio',
              onTap: () => _navigateToScreen(context, 'ContactosSeguridad'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 45),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 0, 51, 102),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.black38,
                      ),
                    ).dynamicTextSize(
                      context: context,
                      maxWidth: MediaQuery.of(context).size.width - 82,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => getScreenWidget(screenName)),
    );
  }

  Widget getScreenWidget(String screenName) {
    switch (screenName) {
      case 'ReportarProblema':
        return SecurityProblemForm();
      case 'Llamada911':
        return EmergencyContactScreen();
      case 'ContactosSeguridad':
        return TrustedContactScreen();
      default:
        return Scaffold(body: Center(child: Text('Pantalla no encontrada')));
    }
  }
}
