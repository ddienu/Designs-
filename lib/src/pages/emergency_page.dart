import 'package:disenos_app/src/widgets/headers_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        titulo: 'Haz solicitado',
        subtitulo: 'Emergencia Médica',
        // color1: Colors.red,
        // color2: Colors.yellow,
      ),
    );
    }
  }