import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {
  const RadialProgress({this.porcentaje});

  final porcentaje;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>  with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    
    porcentajeAnterior = widget.porcentaje;

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200)
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward( from: 0.0 );

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;

    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller, 
      builder: (BuildContext context, Widget? child){
        return Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress( (widget.porcentaje - diferenciaAnimar) + ( diferenciaAnimar * controller.value) ),
          ),
          
        );
      }
      );
    
  }
}
class _MiRadialProgress extends CustomPainter {

  final porcentaje;

  _MiRadialProgress( this.porcentaje );
  @override
  void paint(Canvas canvas, Size size) {

    //Draw full circle.

    final paint = Paint();

    paint.color = Colors.grey;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4.0;

    final  center = Offset(size.width * 0.5, size.height* 0.5);
    final  radio  = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Draw arc.

    final paintArco = Paint()
    ..color = Colors.pink
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10.0;

    final arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco);

    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}