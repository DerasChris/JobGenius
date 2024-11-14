import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjenius/APISERVICE/trabajador/trabajador_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/trabajador_service.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_model.dart';
import 'package:jobjenius/APISERVICE/trabajador/usuario_service.dart';
import 'package:jobjenius/detalleTrabajador.dart';
import 'package:jobjenius/main.dart';
import 'package:jobjenius/theme/app_color.dart';
import 'package:jobjenius/utils/utils.dart';
import 'package:jobjenius/widgets/SearchBarWidget.dart';

class BusquedaTabajadores extends StatefulWidget {
  const BusquedaTabajadores({super.key});

  @override
  State<BusquedaTabajadores> createState() => _BusquedaTabajadoresState();
}



class _BusquedaTabajadoresState extends State<BusquedaTabajadores> {

  List<Usuario> trabajadores = []; 
  bool isLoading = true; 
  
    @override
  void initState() {
    super.initState();
    _loadTrabajadores(); 
  }

   Future<void> _loadTrabajadores() async {
    try {
      List<Usuario> trabajadoresList = await getUser(); // Llamada al servicio
      setState(() {
        trabajadores = trabajadoresList;
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

  void openFilterDialog() async {
    await FilterListDialog.display<Categorias>(
      
      headlineText: 'Selecciona uno o mas items',
      backgroundColor: appColor.azul,
      context,
      listData: categorias,
      selectedListData: categorias,
      choiceChipLabel: (categorias) => categorias!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (categorias, query) {
        return categorias.name!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          categorias = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.fondo,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
        child: 
        isLoading
        ?const Center(child: CircularProgressIndicator())
        :Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Busqueda de trabajadores',
                style: Utils.poppins(18, FontWeight.w700, Colors.black),
              ),
            ),
            const SizedBox(height: 20,),
            const Center(
              child: SearchBarWidget(),
            ),
            Center(child: Container(
              child: GestureDetector(
                onTap: () {
                  openFilterDialog();
                },
                child: const Icon(Icons.filter_alt,size: 30,)),
              )
              ),
            Expanded(
              child: ListView.builder(
                itemCount: trabajadores.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset('assets/image 15.png'),
                      title: Text('Nombre: '+trabajadores[index].nombreCompleto,style: Utils.poppins(14, FontWeight.w700, Colors.black),),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tel:'+trabajadores[index].telefono,style: Utils.poppins(12, FontWeight.w700, Colors.black),),
                          Text('Dirección: '+trabajadores[index].ubicacion,style: Utils.poppins(12, FontWeight.w700, Colors.black),),
                          Text('Email '+trabajadores[index].email ,style: Utils.poppins(12, FontWeight.w700, Colors.black),),
                          Text('ID '+trabajadores[index].firebaseUID ,style: Utils.poppins(12, FontWeight.w700, Colors.black),),
                        ],
                      ),
                      trailing: GestureDetector(
                        child: const Icon(Icons.arrow_forward),
                        onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetalleTrabajador(trabajador: trabajadores[index].firebaseUID,),
                                    ),
                                  );
                                }
                        ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}




class Categorias {
  final String? name;
  final String? avatar;
  Categorias({this.name, this.avatar});
}

List<Categorias> categorias = [
  Categorias(name: "Fontanero", avatar: ""),
  Categorias(name: "Electricista", avatar: ""),
  Categorias(name: "Maestro de obra", avatar: ""),
  Categorias(name: "Carpintero", avatar: ""),
  Categorias(name: "Pintor", avatar: ""),
  Categorias(name: "Soldador", avatar: ""),
  Categorias(name: "Albañil", avatar: ""),
  Categorias(name: "Jardinero", avatar: ""),
  Categorias(name: "Cerrajero", avatar: ""),
  Categorias(name: "Herrero", avatar: ""),
  Categorias(name: "Mecánico", avatar: ""),
  Categorias(name: "Vidriero", avatar: ""),
  Categorias(name: "Tapicero", avatar: ""),
];

