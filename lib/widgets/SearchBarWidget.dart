import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        cursorColor: Colors.black26,
        decoration:  InputDecoration(
          border: InputBorder.none,
          hintText: 'Buscar',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 35,
              height: 35,
              color: const Color.fromARGB(255, 255, 193, 7),
              child: Icon(Icons.menu, size: 20,)
              ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0)
        ),
        style: GoogleFonts.poppins()
      ),
    );
  }
}