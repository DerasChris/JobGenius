import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jobjenius/Trabajadores.dart';
import 'package:jobjenius/seguridad.dart';

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
     Seguridad(),
      ModuloInicio(),
       ModuloInicio(),
        ModuloInicio(),

  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home,size: 30,),
      Icon(Icons.search,size: 30,),
      Icon(Icons.add,size: 30,),
      Icon(Icons.settings,size: 30,),
      Icon(Icons.person,size: 30,),
    ];
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.black)
        ),
        child: CurvedNavigationBar(
          color: Color.fromARGB(255, 214, 214, 214),
          key: navigationKey,
          items: items,
          index: index,
          onTap: (index )=> setState (() => this.index = index),
          backgroundColor: Colors.transparent ,
        ),
      ),
    );
  }
}