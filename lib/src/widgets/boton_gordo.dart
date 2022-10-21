import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BotonGordo extends StatelessWidget {

  final IconData icono;
  final IconData iconoBoton;
  final String titulo;
  final Color color1;
  final Color color2;
  final Function() onPressed;

  const BotonGordo({
    required this.icono, 
    required this.titulo, 
    this.color1 = const Color(0xFF6989F5), 
    this.color2 = const Color(0xFF906EF5), 
    required this.onPressed,
    this.iconoBoton = FontAwesomeIcons.chevronRight,
    });

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        _BotonGordoBackground(
          icono: this.icono,
          color1: color1,
          color2: color2,
        ),

        _BotonGordoInformation(
          icono: this.icono,
          iconoBoton: this.iconoBoton,
          titulo: this.titulo,
          onPressed: this.onPressed,
        )
      ],
    );
    
  }
}

class _BotonGordoInformation extends StatelessWidget {

  final IconData icono;
  final IconData iconoBoton;
  final String titulo;
  final Function() onPressed;
  
  const _BotonGordoInformation({
    required this.icono, 
    required this.titulo, 
    required this.onPressed,
    this.iconoBoton = FontAwesomeIcons.chevronRight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 125.0, width: 40.0,),
        FaIcon( this.icono, color: Colors.white, size: 35.0),
        SizedBox(width: 40.0),
        Expanded(child: Text(this.titulo, style: TextStyle( color: Colors.white70, fontSize: 16.0),)),
        IconButton(
          onPressed: this.onPressed,
          icon: FaIcon ( this.iconoBoton, color: Colors.white, size: 18)),
        SizedBox( width: 40.0),
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final IconData icono;
  final Color color1;
  final Color color2;
  
  const _BotonGordoBackground({
    required this.icono, 
    this.color1 = const Color(0xFF6989F5), 
    this.color2 = const Color(0xFF906EF5), 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children:[ 
            Positioned(
            right: -20,
            top: -20,
            child: FaIcon( this.icono, color: Colors.white30, size: 150.0)),
          ]
        ),
      ),
      margin: EdgeInsets.all(15.0),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: <Color>[
            color1,
            color2,
          ]
          ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 6),
            color: Colors.black38,
            blurRadius: 10.0,
          )
        ]



      ),
    );
  }
}