import 'package:flutter/material.dart';
import 'package:feedtrabajos/theme/app_color.dart';

class PaginaDeTrabajos extends StatefulWidget {
  @override
  _PaginaDeTrabajosState createState() => _PaginaDeTrabajosState();
}

class _PaginaDeTrabajosState extends State<PaginaDeTrabajos> {
  String etiquetaSeleccionada = 'Todos';

  final List<Map<String, String>> trabajos = [
    {
      'titulo': 'Albañil (Trabajo Eventual)',
      'descripcion': 'Quiero hacer un muro en mi casa, ¿Algún albañil? Soy de San Salvador. Pago por obra.',
      'etiqueta': 'Albañil',
    },
    {
      'titulo': 'Electricista (Trabajo Eventual)',
      'descripcion': 'Necesito un electricista para instalar y mantener sistemas eléctricos en Santa Tecla. Pago por obra.',
      'etiqueta': 'Electricista',
    },
    {
      'titulo': 'Pastelero (Trabajo Permanente)',
      'descripcion': 'Pastelería en San Salvador busca pastelero con experiencia en repostería fina. \$350 al mes.',
      'etiqueta': 'Pastelero',
    },
    {
      'titulo': 'Agricultor (Trabajo Permanente)',
      'descripcion': 'Se necesita agricultor con experiencia en cultivos de maíz y frijol en La Libertad. \$350 al mes.',
      'etiqueta': 'Agricultor',
    },
    {
      'titulo': 'Artesano (Trabajo Eventual)',
      'descripcion': 'Buscamos artesano para crear productos personalizados en San Miguel. Pago por obra.',
      'etiqueta': 'Artesano',
    },
    {
      'titulo': 'Zapatero (Trabajo Permanente)',
      'descripcion': 'Se busca zapatero con experiencia en reparación de calzado en Santa Ana. \$400 al mes.',
      'etiqueta': 'Zapatero',
    },
    {
      'titulo': 'Panadero (Trabajo Permanente)',
      'descripcion': 'Panadería en San Salvador busca panadero con experiencia en panadería artesanal. \$450 al mes.',
      'etiqueta': 'Panadero',
    },
    {
      'titulo': 'Jardinero (Trabajo Eventual)',
      'descripcion': 'Se necesita jardinero para mantenimiento de jardines en San Vicente. Pago por obra.',
      'etiqueta': 'Jardinero',
    },
    {
      'titulo': 'Vigilante (Trabajo Permanente)',
      'descripcion': 'Condominio privado en San Salvador busca vigilante con experiencia. \$500 al mes.',
      'etiqueta': 'Vigilante',
    },
    {
      'titulo': 'Portero (Trabajo Permanente)',
      'descripcion': 'Se busca portero para edificio residencial en Santa Tecla. \$400 al mes.',
      'etiqueta': 'Portero',
    },
    {
      'titulo': 'Plomero (Trabajo Eventual)',
      'descripcion': 'Necesito plomero urgente en San Miguel. Pago por obra.',
      'etiqueta': 'Plomero',
    },
    {
      'titulo': 'Instalador de Calefacción (Trabajo Eventual)',
      'descripcion': 'Busco instalador de calefacción con experiencia para vivienda en San Salvador. Pago por obra.',
      'etiqueta': 'Instalador de Calefacción',
    },
    {
      'titulo': 'Fontanero (Trabajo Eventual)',
      'descripcion': 'Se busca fontanero con experiencia en mantenimiento de sistemas de agua en Santa Ana. Pago por obra.',
      'etiqueta': 'Fontanero',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> trabajosFiltrados = etiquetaSeleccionada == 'Todos'
        ? trabajos
        : trabajos.where((trabajo) => trabajo['etiqueta'] == etiquetaSeleccionada).toList();

    return Scaffold(
      backgroundColor: appColor.fondo, 
      appBar: AppBar(
        backgroundColor: appColor.fondo, 
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Trabajos disponibles',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: appColor.fondo, 
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: etiquetaSeleccionada,
                    isExpanded: true,
                    items: <String>['Todos', 'Albañil', 'Electricista', 'Pastelero', 'Agricultor', 'Artesano', 'Zapatero', 'Panadero', 'Jardinero', 'Vigilante', 'Portero', 'Plomero', 'Instalador de Calefacción', 'Fontanero']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        etiquetaSeleccionada = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: appColor.fondo, 
              child: ListView.builder(
                itemCount: trabajosFiltrados.length,
                itemBuilder: (context, index) {
                  final trabajo = trabajosFiltrados[index];
                  return Card(
                    color: appColor.azul, 
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trabajo['titulo']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            trabajo['descripcion']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appColor.amarillo, 
                              foregroundColor: Colors.black, 
                            ),
                            child: const Text('Contactar'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}