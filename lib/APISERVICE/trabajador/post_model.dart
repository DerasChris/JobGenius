// post_model.dart
class Post {
  String usuarioId;
  String trabajadorId;
  String tipoTrabajo;
  String descripcionProblema;
  String nivelUrgencia;
  String hora;
  String fecha;
  int presupuesto;
  String estado;
  String fotosProblema;


  Post({
    required this.usuarioId,
    required this.trabajadorId,
    required this.tipoTrabajo,
    required this.descripcionProblema,
    required this.nivelUrgencia,
    required this.fotosProblema,
    required this.hora,
    required this.fecha,
    required this.presupuesto,
    required this.estado,

  });

  Map<String, dynamic> toJson() {
    return {
      "usuarioId": usuarioId,
      "trabajadorId": trabajadorId,
      "tipoTrabajo": tipoTrabajo,
      "descripcionProblema": descripcionProblema,
      "nivelUrgencia": nivelUrgencia,
      "fotosProblema":fotosProblema,
      "hora": hora,
      "fecha": fecha,
      "presupuesto": {
        "\$numberInt": presupuesto.toString()
      },
      "estado": estado,
    };
  }
 factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      usuarioId: json['usuarioId'],
      trabajadorId: json['trabajadorId'],
      tipoTrabajo: json['tipoTrabajo'],
      descripcionProblema: json['descripcionProblema'],
      nivelUrgencia: json['nivelUrgencia'],
      fotosProblema: json['fotosProblema'],
      hora: json['hora'],
      fecha: json['fecha'],
      presupuesto: int.parse(json['presupuesto']['\$numberInt']),
      estado: json['estado'],
    );
  }
}
