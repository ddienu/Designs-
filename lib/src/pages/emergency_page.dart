import 'package:animate_do/animate_do.dart';
import 'package:disenos_app/src/widgets/boton_gordo.dart';
import 'package:disenos_app/src/widgets/headers_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final items = <ItemBoton>[
  ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
  ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
  ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
  ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
  ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
  ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
  ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
  ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
  ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
  ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
  ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
  ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
];

  List<Widget> itemMap = items.map(
    (item) => FadeInDown(
      duration: Duration( milliseconds: 400),
      child: BotonGordo(
        icono: item.icon,
        titulo: item.texto,
        color1: item.color1,
        color2: item.color2,
        onPressed: () { print('Hola');},
      ),
    )).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only( top: 200.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
               children: [
               SizedBox(height: 110.0),
               BotonGordoTemp(),
               ...itemMap
               ]
              ),
          ),
          IconHeader(
             icon: FontAwesomeIcons.plus, 
             titulo: 'Haz solicitado', 
             subtitulo: 'Emergencia médica',
             color1: const Color(0xff536CF6),
             color2: const Color(0xff66A9F2),
             ),
        ],
      )
      );
    }
  }

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icono: FontAwesomeIcons.plus,
      iconoBoton: FontAwesomeIcons.chevronRight,
      titulo: 'Medical Emergency',
      color1: Colors.blueAccent,
      color2: Colors.blue,
      onPressed: (){},
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Haz solicitado',
      subtitulo: 'Emergencia Médica',
      // color1: Colors.red,
      // color2: Colors.yellow,
    );
  }
}