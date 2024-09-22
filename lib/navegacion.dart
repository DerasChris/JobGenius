import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jobjenius/Busqueda.dart';
import 'package:jobjenius/Trabajadores.dart';
import 'package:jobjenius/seguridad.dart';
import 'theme/app_color.dart';
class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}



class _NavigationState extends State<Navigation> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index =2;

  final Screens = [
    ModuloInicio(),
    BusquedaTabajadores(),
    ModuloInicio(),
    Seguridad(),
    ModuloInicio(),

  ];

  // Método para generar íconos dinámicamente con colores dependiendo del estado
  Widget buildIcon(IconData iconData, int itemIndex) {
    return Icon(
      iconData,
      size: 30,
      color: index == itemIndex ? Colors.white : Colors.black, // Cambia el color según el ítem seleccionado
    );
  }
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      buildIcon(Icons.home, 0),
      buildIcon(Icons.search, 1),
      buildIcon(Icons.add, 2),
      buildIcon(Icons.settings, 3),
      buildIcon(Icons.person, 4),
    ];
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        body: Screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.black)
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(45), // Aplica los bordes redondeados
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3), // sombra hacia abajo
                  ),
                ],
              ),
            child: CurvedNavigationBar(
              height: 50,
              color: appColor.amarillo,
              key: navigationKey,
              items: items,
              index: index,
              onTap: (index )=> setState (() => this.index = index),
              backgroundColor: Colors.transparent ,
              buttonBackgroundColor: appColor.azul,
            ),
          ),
        ),
      ),
    );
  }
}