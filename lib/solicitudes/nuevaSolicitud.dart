import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  
  String? tipoTrabajo;
  String? urgencia;
  String? metodoPago;
  DateTime? fechaHora;

  // Método para seleccionar imagen
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Método para seleccionar fecha y hora
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      helpText: "Selecciona la fecha",
      cancelText: "Cancelar",
      confirmText: "Listo",
      builder: (BuildContext context, Widget? widget) => Theme(
        data: ThemeData(
          colorScheme:  ColorScheme.light(primary: appColor.azul),
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
          colorScheme:  ColorScheme.light(primary: appColor.azul),
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
          fechaHora = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
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
              // Información del solicitante
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                    color: appColor.azul,
                    fontSize: 18
                  ), // Color de la etiqueta cuando se eleva
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColor.azul, width: 2.0),  // Borde cuando está seleccionado (focado)
                  ),
                  labelText: 'Nombre completo',
                  
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                
                controller: telefonoController,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                    color: appColor.azul,
                    fontSize: 18
                  ), // Color de la etiqueta cuando se eleva
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColor.azul, width: 2.0),  // Borde cuando está seleccionado (focado)
                  ),
                  labelText: 'Teléfono'
                  ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu teléfono';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ubicacionController,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                    color: appColor.azul,
                    fontSize: 18
                  ), // Color de la etiqueta cuando se eleva
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColor.azul, width: 2.0),  // Borde cuando está seleccionado (focado)
                  ),
                  labelText: 'Ubicación'
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu ubicación';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Detalles del trabajo
              DropdownButtonFormField<String>(
                value: tipoTrabajo,
                items: [
                  DropdownMenuItem(value: 'Reparación de electrodomésticos', child: Text('Reparación de electrodomésticos')),
                  DropdownMenuItem(value: 'Fontanería', child: Text('Fontanería')),
                  DropdownMenuItem(value: 'Electricidad', child: Text('Electricidad')),
                ],
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                    color: appColor.azul,
                    fontSize: 18
                  ), // Color de la etiqueta cuando se eleva
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColor.azul, width: 2.0),  // Borde cuando está seleccionado (focado)
                  ),
                  labelText: 'Tipo de trabajo'

                  ),
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
                    fontSize: 18
                  ), // Color de la etiqueta cuando se eleva
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColor.azul, width: 2.0),  // Borde cuando está seleccionado (focado)
                  ),
                  labelText: 'Descripción del problema'
                  ),
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
                  DropdownMenuItem(value: 'Inmediato', child: Text('Inmediato')),
                  DropdownMenuItem(value: 'Próximos días', child: Text('Próximos días')),
                  DropdownMenuItem(value: 'No urgente', child: Text('No urgente')),
                ],
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                    color: appColor.azul,
                    fontSize: 18
                  ), // Color de la etiqueta cuando se eleva
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColor.azul, width: 2.0),  // Borde cuando está seleccionado (focado)
                  ),
                  labelText: 'Nivel de urgencia'
                  ),
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
                  foregroundColor: Colors.white
                ),
              ),
              
              SizedBox(height: 20),
              
              // Preferencias del solicitante
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColor.azul,
                  textStyle: Utils.poppins(14, FontWeight.bold, Colors.white),
                  foregroundColor: Colors.white
                ),
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
            activeColor: appColor.amarillo, // Color de la parte activa del slider
            inactiveColor: appColor.azul, // Color de la parte inactiva
          ),
              DropdownButtonFormField<String>(
                value: metodoPago,
                items: [
                  DropdownMenuItem(value: 'Efectivo', child: Text('Efectivo')),
                  DropdownMenuItem(value: 'Transferencia', child: Text('Transferencia')),
                ],
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                    color: appColor.azul,
                    fontSize: 18
                  ), // Color de la etiqueta cuando se eleva
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColor.azul, width: 2.0),  // Borde cuando está seleccionado (focado)
                  ),
                  labelText: 'Método de pago preferido'
                  ),
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
                  foregroundColor: Colors.black
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Guardar la solicitud o enviarla a la base de datos
                    print('Formulario enviado');
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