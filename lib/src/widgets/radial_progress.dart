import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {
  const RadialProgress({this.porcentaje});

  final porcentaje;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text( '${widget.porcentaje}'),
      
    );
    
  }
}