import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/extensions/SafeNavigationExtension.dart';
import 'package:jobjenius/theme/app_color.dart';

class WorkHistoryView extends StatelessWidget {
  const WorkHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.safeNavigateBack(),
        ),
        title: Text(
          'Historial Laboral',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20, color: Colors.black),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 16),
          _buildTimelineItem(
            context,
            icon: Icons.work_history_outlined,
            title: 'Albañileria - Construccion de muro',
            company: 'Domicilio Particular - San Salvador',
            period: '2 Semanas',
            description:
                'Contrunccion de muro perimetral de 20 metros de largo.',
            isFirst: true,
          ),
          _buildTimelineItem(
            context,
            icon: Icons.work_history_rounded,
            title: 'Soldadura - Reparancion de porton metalico',
            company: 'Taller Mecanico, San Salvador',
            period: '1 Semana',
            description:
                'Soldadura de bisagras y refuerzos en porton principal.',
          ),
          _buildTimelineItem(
            context,
            icon: Icons.work_history_outlined,
            title: 'Pintura - Pintura exterior de vivienda',
            company: 'Domicilio Particular - La Libertad',
            period: '1 Semana',
            description: 'Pintura completa de fachada en una vivienda.',
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String company,
    required String period,
    required String description,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return SizedBox(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                if (!isFirst)
                  const Expanded(
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appColor.azul,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(icon, color: Colors.white),
                ),
                if (!isLast)
                  const Expanded(
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),
                      const SizedBox(height: 4),
                      Text(company,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          )),
                      const SizedBox(height: 4),
                      Text(
                        period,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
