
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobjenius/APISERVICE/trabajador/categoria_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/trabajador_model.dart';


const String baseUrl = 'https://eagle-clever-lately.ngrok-free.app';  // Reemplaza con tu URL de API

// Servicio para obtener las categorías de oficios
Future<List<Trabajador>> getTrabajadores() async {
  final response = await http.get(
    Uri.parse('$baseUrl/trabajadores'),
    headers: {"Content-Type": "application/json"},
  );

  print('Código de respuesta: ${response.statusCode}');
  print('Respuesta del servidor: ${response.body}');

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Trabajador.fromJson(json)).toList();
    print("funca");
  } else {
    throw Exception('Error al obtener los trabajadores');
  }
}
