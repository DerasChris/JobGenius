import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



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
                  const Icon(
                    Icons.arrow_back,
                    size: 30,
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
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.report_gmailerrorred_outlined,
                    size: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reporta un problema de seguridad',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 0, 51, 102),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Reporta un problema de seguridad con \nel trabajador',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black38),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              Row(
                children: [
                  const Icon(
                    Icons.phone_in_talk_outlined,
                    size: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Llamada al 911',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 0, 51, 102),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Contacta al 911 y comparte tu ubicación \ncon las autoridades en caso de emergencia',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black38),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}
