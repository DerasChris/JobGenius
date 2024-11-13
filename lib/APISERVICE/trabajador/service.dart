// post_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

const String baseUrl = 'https://eagle-clever-lately.ngrok-free.app/solicitudes';  // Reemplaza con tu URL de API
const String solicitudesuser = 'https://eagle-clever-lately.ngrok-free.app/solicitudes-por-usuario'; 

Future<String> createPost(Post post) async {
  final response = await http.post(
    Uri.parse('$baseUrl/add-solicitud'),
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


Future<List<Post>> getSolicitudes(String id) async {
  final response = await http.get(
    Uri.parse('$solicitudesuser/$id'),
    headers: {"Content-Type": "application/json"},
  );

  print('Código de respuesta: ${response.statusCode}');
  print('Respuesta del servidor: ${response.body}');

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Error al obtener las solicitudes');
  }
}
