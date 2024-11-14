class Usuario {
  String id;
  String firebaseUID;
  String nombreCompleto;
  String email;
  String telefono;
  String ubicacion;
  String rol;
  DateTime fechaRegistro;
  List<String> favoritos;
  String url;

  Usuario({
    required this.id,
    required this.firebaseUID,
    required this.nombreCompleto,
    required this.email,
    required this.telefono,
    required this.ubicacion,
    required this.rol,
    required this.fechaRegistro,
    required this.favoritos,
    required this.url
  });

  // Método para convertir de JSON a objeto Usuario
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['_id'],
      firebaseUID: json['firebaseUID'],
      nombreCompleto: json['nombreCompleto'],
      email: json['email'],
      telefono: json['telefono'],
      ubicacion: json['ubicacion'],
      rol: json['rol'],
      fechaRegistro: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['fechaRegistro']['\$date']['\$numberLong'])),
      favoritos: List<String>.from(json['favoritos']),
      url: json['url']
    );
  }

  // Método para convertir de objeto Usuario a JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firebaseUID': firebaseUID,
      'nombreCompleto': nombreCompleto,
      'email': email,
      'telefono': telefono,
      'ubicacion': ubicacion,
      'rol': rol,
      'fechaRegistro': {
        '\$date': {
          '\$numberLong': fechaRegistro.millisecondsSinceEpoch.toString()
        }
      },
      'favoritos': favoritos,
      'url':url
    };
  }
}
