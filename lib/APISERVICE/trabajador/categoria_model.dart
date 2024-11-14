// oficio_model.dart
class Categoria {
  String nombre;
  String descripcion;
  String url;

  Categoria({
    required this.nombre,
    required this.descripcion,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      "nombre": nombre,
      "descripcion": descripcion,
      "url": url,
    };
  }

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      nombre: json['nombre']??="s",
      descripcion: json['descripcion'],
      url: json['url'],
    );
  }
}
