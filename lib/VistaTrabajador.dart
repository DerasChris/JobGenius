import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/utils/utils.dart';
import 'package:intl/intl.dart';

class SolicitudTrabajo {
  final String nombre;
  final String telefono;
  final String ubicacion;
  final String tipoTrabajo;
  final String descripcion;
  final String urgencia;
  final String fechaHora;
  final int presupuesto;
  final String metodoPago;
  final String? imagenPath;

  SolicitudTrabajo({
    required this.nombre,
    required this.telefono,
    required this.ubicacion,
    required this.tipoTrabajo,
    required this.descripcion,
    required this.urgencia,
    required this.fechaHora,
    required this.presupuesto,
    required this.metodoPago,
    this.imagenPath,
  });
}

class Vistatrabajador extends StatelessWidget {
  final SolicitudTrabajo solicitud;

  const Vistatrabajador({
    super.key,
    required this.solicitud,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la Solicitud'),
        backgroundColor: appColor.fondo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSeccion(
              'Información del Cliente',
              [
                _buildInfoRow('Nombre:', solicitud.nombre),
                _buildInfoRow('Teléfono:', solicitud.telefono),
                _buildInfoRow('Ubicación:', solicitud.ubicacion),
              ],
            ),
            const SizedBox(height: 20),
            _buildSeccion(
              'Detalles del Trabajo',
              [
                _buildInfoRow('Tipo de Trabajo:', solicitud.tipoTrabajo),
                _buildInfoRow('Descripción:', solicitud.descripcion),
                _buildInfoRow('Nivel de Urgencia:', solicitud.urgencia),
              ],
            ),
            const SizedBox(height: 20),
            if (solicitud.imagenPath != null)
              _buildSeccion(
                'Foto del Problema',
                [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: solicitud.imagenPath != null
                        ? Image.file(
                            File(solicitud.imagenPath!),
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Text("No hay imagen"),
                          ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            _buildSeccion(
              'Detalles de Programación',
              [
                if (solicitud.fechaHora != null)
                  _buildInfoRow(
                    'Fecha y Hora:',
                    DateFormat('dd/MM/yyyy HH:mm').format(solicitud.fechaHora! as DateTime),
                  ),
                _buildInfoRow(
                  'Presupuesto Estimado:',
                  '\$${solicitud.presupuesto.round()}',
                ),
                _buildInfoRow('Método de Pago:', solicitud.metodoPago),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColor.azul,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      // Aquí puedes implementar la lógica para aceptar el trabajo
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Trabajo aceptado'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Text(
                      'Aceptar Trabajo',
                      style: Utils.poppins(14, FontWeight.bold, Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      // Aquí puedes implementar la lógica para rechazar el trabajo
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Rechazar',
                      style: Utils.poppins(14, FontWeight.bold, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeccion(String titulo, List<Widget> contenido) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: Utils.poppins(18, FontWeight.bold, Colors.black),
            ),
            const Divider(),
            const SizedBox(height: 8),
            ...contenido,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Utils.poppins(14, FontWeight.bold, Colors.black87),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Utils.poppins(14, FontWeight.normal, Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
