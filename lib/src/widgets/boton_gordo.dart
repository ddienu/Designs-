import 'package:flutter/material.dart';


class BotonGordo extends StatelessWidget {
  const BotonGordo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return _BotonGordoBackground();
    
  }
}

class _BotonGordoBackground extends StatelessWidget {
  const _BotonGordoBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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