class Trabajador {
  String usuarioId;
  String profesion;
  List<String> categorias;
  double calificacion;
  String curriculum;
  int cantidadTrabajosRealizados;
  int aniosExperiencia;
  String descripcion;

  Trabajador({
    required this.usuarioId,
    required this.profesion,
    required this.categorias,
    required this.calificacion,
    required this.curriculum,
    required this.cantidadTrabajosRealizados,
    required this.aniosExperiencia,
    required this.descripcion,
  });

Map<String, dynamic> toJson() {
  return {
    "usuarioId": usuarioId,
    "profesion": profesion,
    "categorias": categorias,
    "calificacion": calificacion, // Enviar directamente como double
    "curriculum": curriculum,
    "cantidadTrabajosRealizados": cantidadTrabajosRealizados, // Enviar directamente como int
    "aniosExperiencia": aniosExperiencia, // Enviar directamente como int
    "descripcion": descripcion,
  };
}

  factory Trabajador.fromJson(Map<String, dynamic> json) {
    return Trabajador(
      usuarioId: json['usuarioId'],
      profesion: json['profesion'],
      categorias: List<String>.from(json['categorias']),
      calificacion: _parseDouble(json['calificacion']),
      curriculum: json['curriculum'],
      cantidadTrabajosRealizados: _parseInt(json['cantidadTrabajosRealizados']),
      aniosExperiencia: _parseInt(json['aniosExperiencia']),
      descripcion: json['descripcion'],
    );
  }
// Función para parsear el valor del campo calificacion
static double _parseDouble(dynamic value) {
  if (value is Map<String, dynamic> && value.containsKey("\$numberDouble")) {
    return double.parse(value["\$numberDouble"]);
  } else if (value is num) { // Si el valor es un número directamente
    return value.toDouble();
  }
  return 0.0; // Valor por defecto si no se encuentra el campo o es incorrecto
}

// Función para parsear el valor de campos que contienen \$numberInt
static int _parseInt(dynamic value) {
  if (value is Map<String, dynamic> && value.containsKey("\$numberInt")) {
    return int.parse(value["\$numberInt"]);
  } else if (value is int) { // Si el valor es un número entero directamente
    return value;
  }
  return 0; // Valor por defecto si no se encuentra el campo o es incorrecto
}

}
