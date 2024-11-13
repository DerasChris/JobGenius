// trabajador_model.dart
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
      "calificacion": {"\$numberDouble": calificacion.toString()},
      "curriculum": curriculum,
      "cantidadTrabajosRealizados": {"\$numberInt": cantidadTrabajosRealizados.toString()},
      "aniosExperiencia": {"\$numberInt": aniosExperiencia.toString()},
      "descripcion": descripcion,
    };
  }

  factory Trabajador.fromJson(Map<String, dynamic> json) {
    return Trabajador(
      usuarioId: json['usuarioId'],
      profesion: json['profesion'],
      categorias: List<String>.from(json['categorias']),
      calificacion: double.parse(json['calificacion']['\$numberDouble']),
      curriculum: json['curriculum'],
      cantidadTrabajosRealizados: int.parse(json['cantidadTrabajosRealizados']['\$numberInt']),
      aniosExperiencia: int.parse(json['aniosExperiencia']['\$numberInt']),
      descripcion: json['descripcion'],
    );
  }
}
