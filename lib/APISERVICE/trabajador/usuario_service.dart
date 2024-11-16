
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobjenius/APISERVICE/trabajador/categoria_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/trabajador_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_model.dart';


const String baseUrl = 'https://mondongodb-lara.aclx8p.easypanel.host';  // Reemplaza con tu URL de API

// Servicio para obtener las categorías de oficios
Future<List<Usuario>> getUser() async {
  final response = await http.get(
    Uri.parse('$baseUrl/usuario-trabajador'),
    headers: {"Content-Type": "application/json"},
  );

  print('Código de respuesta: ${response.statusCode}');
  print('Respuesta del servidor: ${response.body}');

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Usuario.fromJson(json)).toList();
    print("funca");
  } else {
    throw Exception('Error al obtener los trabajadores');
  }
}

Future<String> createUser(Usuario post) async {
  final response = await http.post(
    Uri.parse('$baseUrl/usuario-add'),
    headers: {"Content-Type": "application/json"},
    body: json.encode(post.toJson()),
  );

  print('Código de respuesta: ${response.statusCode}');
    print('Respuesta del servidor: ${response.body}');

  if (response.statusCode == 200) {
    return 'Creado con exito la solicitud..!';
  } else {
    throw Exception('Error al crear el post');
  }
}

// Servicio para obtener el rol de usuario
Future<List<Usuario>> getRolUser(String id) async {
  final response = await http.get(
    Uri.parse('$baseUrl/usuario/$id'),
    headers: {"Content-Type": "application/json"},
  );

  print('Código de respuesta: ${response.statusCode}');
  print('Respuesta del servidor: ${response.body}');

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    // Aquí verificamos si la respuesta es un solo usuario
    if (data.isNotEmpty) {
      Usuario usuario = Usuario.fromJson(data);
      return [usuario]; // Retorna una lista con un solo usuario
    } else {
      print("El objeto de usuario está vacío.");
      return [];
    }
  } else {
    throw Exception('Error al obtener el usuario');
  }
}
