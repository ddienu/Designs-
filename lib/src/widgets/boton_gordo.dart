import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BotonGordo extends StatelessWidget {
  const BotonGordo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        _BotonGordoBackground(),

        _BotonGordoInformation()
      ],
    );
    
  }
}

class _BotonGordoInformation extends StatelessWidget {
  const _BotonGordoInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 125.0, width: 40.0,),
        FaIcon( FontAwesomeIcons.carBurst, color: Colors.white, size: 35.0),
        SizedBox(width: 40.0),
        Expanded(child: Text('Motor Accident', style: TextStyle( color: Colors.white70, fontSize: 16.0),)),
        IconButton(
          onPressed: (){},
          icon: FaIcon ( FontAwesomeIcons.chevronRight, color: Colors.white, size: 18)),
        SizedBox( width: 40.0),
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  const _BotonGordoBackground({
    Key? key,
  }) : super(key: key);

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
            child: FaIcon( FontAwesomeIcons.carBurst, color: Colors.white30, size: 150.0)),
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
            Color(0xFF6989F5),
            Color(0xFF906EF5),
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