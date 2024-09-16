import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class Utils {

  static TextStyle poppins(double size, FontWeight tipo, Color colore ){
      TextStyle Fuente = GoogleFonts.poppins( fontSize: size,fontWeight:tipo,color: colore);
      return Fuente;
  }

}