import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: SvgPicture.asset(
                  'assets/back.svg',
                  fit: BoxFit.cover, 
                )
              ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/Logo.png'),
                    width: 250,
                  )
                ],
              ),
            ),
           Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Positioned(
                  top: 150,
                      child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(33, 150, 243, 1),
                                
                              ),
                              onPressed: () {}, 
                              child: const Text('Empezar'),
                              
                            ),
                 
                  ),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
