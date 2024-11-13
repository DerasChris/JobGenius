import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jobjenius/APISERVICE/trabajador/categoria_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/categoria_service.dart';
import 'package:jobjenius/APISERVICE/trabajador/post_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/service.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/utils/utils.dart';

class Nuevasolicitud extends StatefulWidget {
  const Nuevasolicitud({super.key});

  @override
  State<Nuevasolicitud> createState() => _NuevasolicitudState();
}

class _NuevasolicitudState extends State<Nuevasolicitud> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  File? _image;
  double _currentBudget = 50; // Valor inicial del slider
  // Controladores de los campos de texto
  TextEditingController nombreController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController ubicacionController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController presupuestoController = TextEditingController();

  List<Categoria> categorias = []; 
  bool isLoading = true; 

  String? tipoTrabajo;
  String? urgencia;
  String? metodoPago;
  DateTime? fechaHora;
  String _imageUrl ="";

    @override
  void initState() {
    super.initState();
    _loadCategorias(); 
  }

  // Método para seleccionar imagen
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        await _uploadImage(pickedFile);
      } else {
        print('No image selected.');
      }
    });
  }


  Future<void> _uploadImage(XFile file) async {
    try {
      // Crear una referencia a Firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Subir el archivo a Firebase Storage
      UploadTask uploadTask = ref.putFile(
        File(file.path),
      );

      // Esperar a que se complete la carga
      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

      // Obtener la URL de la imagen cargada
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _imageUrl = downloadUrl;
      });

      print('Imagen cargada con éxito, URL: $downloadUrl');
    } catch (e) {
      print('Error al cargar la imagen: $e');
    }
  }




//cargar categorias
 Future<void> _loadCategorias() async {
    try {
      List<Categoria> categoriasList = await getCategorias(); // Llamada al servicio
      setState(() {
        categorias = categoriasList;
        isLoading = false; // Detener la carga una vez que los datos se han obtenido
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error al cargar las categorías: $e');
      print(categorias);
    }
  }

  // Método para seleccionar fecha y hora
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      helpText: "Selecciona la fecha",
      cancelText: "Cancelar",
      confirmText: "Listo",
      builder: (BuildContext context, Widget? widget) => Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(primary: appColor.azul),
          datePickerTheme: DatePickerThemeData(
            backgroundColor: Colors.white,
            dividerColor: appColor.azul,
            headerBackgroundColor: appColor.azul,
            headerForegroundColor: Colors.white,
          ),
        ),
        child: widget!,
      ),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        helpText: "Selecciona la hora",
        hourLabelText: "Hora",
        minuteLabelText: "Minutos",
        cancelText: "Cancelar",
        confirmText: "Listo!",
        builder: (BuildContext context, Widget? widget) => Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(primary: appColor.azul),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.white,
              dividerColor: appColor.azul,
              headerBackgroundColor: appColor.azul,
              headerForegroundColor: Colors.white,
            ),
          ),
          child: widget!,
        ),
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          fechaHora = DateTime(pickedDate.year, pickedDate.month,
              pickedDate.day, pickedTime.hour, pickedTime.minute);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Orden de Trabajo'),
        backgroundColor: appColor.fondo,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Detalles del trabajo
              isLoading
              ?Center(child: CircularProgressIndicator())
              :DropdownButtonFormField<String>(
                value: tipoTrabajo,
                      items: categorias.map((Categoria categoria) {
                        return DropdownMenuItem<String>(
                          value: categoria.nombre, // Asegúrate de que 'nombre' sea un campo en tu clase Categoria
                          child: Text(categoria.nombre),
                        );
                      }).toList(),
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                        color: appColor.azul,
                        fontSize: 18), // Color de la etiqueta cuando se eleva
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: appColor.azul,
                          width:
                              2.0), // Borde cuando está seleccionado (focado)
                    ),
                    labelText: 'Tipo de trabajo'),
                onChanged: (value) {
                  setState(() {
                    tipoTrabajo = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona el tipo de trabajo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descripcionController,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                        color: appColor.azul,
                        fontSize: 18), // Color de la etiqueta cuando se eleva
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: appColor.azul,
                          width:
                              2.0), // Borde cuando está seleccionado (focado)
                    ),
                    labelText: 'Descripción del problema'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor describe el problema';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: urgencia,
                items: [
                  DropdownMenuItem(
                      value: 'Inmediato', child: Text('Inmediato')),
                  DropdownMenuItem(
                      value: 'Próximos días', child: Text('Próximos días')),
                  DropdownMenuItem(
                      value: 'No urgente', child: Text('No urgente')),
                ],
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                        color: appColor.azul,
                        fontSize: 18), // Color de la etiqueta cuando se eleva
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: appColor.azul,
                          width:
                              2.0), // Borde cuando está seleccionado (focado)
                    ),
                    labelText: 'Nivel de urgencia'),
                onChanged: (value) {
                  setState(() {
                    urgencia = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona la urgencia';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // Fotos del problema
              Text('Fotos del problema:'),
              _image == null
                  ? Text('No se ha seleccionado imagen.')
                  : Image.file(
                      _image!,
                      fit: BoxFit.contain,
                    ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Subir imagen'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.azul,
                    textStyle: Utils.poppins(14, FontWeight.bold, Colors.white),
                    foregroundColor: Colors.white),
              ),

              SizedBox(height: 20),

              // Preferencias del solicitante
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.azul,
                    textStyle: Utils.poppins(14, FontWeight.bold, Colors.white),
                    foregroundColor: Colors.white),
                onPressed: () => _selectDateTime(context),
                child: Text(fechaHora == null
                    ? 'Seleccionar fecha y hora preferida'
                    : 'Fecha seleccionada: ${DateFormat('dd/MM/yyyy HH:mm').format(fechaHora!)}'),
              ),
              Text(
                'Presupuesto estimado: \$${_currentBudget.round()}',
                style: TextStyle(fontSize: 18),
              ),
              Slider(
                value: _currentBudget,
                min: 0,
                max: 500,
                divisions: 100, // Número de divisiones en el slider
                label: '\$${_currentBudget.round()}',
                onChanged: (value) {
                  setState(() {
                    _currentBudget = value;
                  });
                },
                activeColor:
                    appColor.amarillo, // Color de la parte activa del slider
                inactiveColor: appColor.azul, // Color de la parte inactiva
              ),
              DropdownButtonFormField<String>(
                value: metodoPago,
                items: [
                  DropdownMenuItem(value: 'Efectivo', child: Text('Efectivo')),
                  DropdownMenuItem(
                      value: 'Transferencia', child: Text('Transferencia')),
                ],
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                        color: appColor.azul,
                        fontSize: 18), // Color de la etiqueta cuando se eleva
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: appColor.azul,
                          width:
                              2.0), // Borde cuando está seleccionado (focado)
                    ),
                    labelText: 'Método de pago preferido'),
                onChanged: (value) {
                  setState(() {
                    metodoPago = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona el método de pago';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // Botón de envío
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.amarillo,
                    textStyle: Utils.poppins(14, FontWeight.bold, Colors.black),
                    foregroundColor: Colors.black),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Crear un objeto Post con los datos del formulario
                    final newPost = Post(
                      usuarioId:'64b5f67a7a1f4625b9e8b001', // ID quemado del usuario
                      trabajadorId:'64b5f67a7a1f4625b9e8b002', // ID quemado del trabajador
                      tipoTrabajo: tipoTrabajo!,
                      descripcionProblema: descripcionController.text,
                      nivelUrgencia: urgencia!,
                      fotosProblema: _imageUrl,
                      hora: "12:00",
                      fecha:  DateFormat('yyyy-MM-dd – kk:mm').format(fechaHora!),
                      presupuesto:666,
                      estado: 'pendiente', // Estado inicial
                    );

                    try {
                      // Llamar al servicio para crear el post
                      final result = await createPost(newPost);
                      print('Formulario enviado: $result');
                      // Puedes mostrar un mensaje de éxito o navegar a otra pantalla
                    } catch (error) {
                      print('Error al enviar el formulario: $error');
                      // Muestra un mensaje de error
                    }
                  }
                },
                child: Text('Enviar solicitud'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
