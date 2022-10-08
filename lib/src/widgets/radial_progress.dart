import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {
  const RadialProgress({
    required this.porcentaje,
    this.colorPrimario = Colors.grey,
    this.colorSecundario = Colors.blue,
    this.grosorPrimario = 4.0,
    this.grosorSecundario = 10.0,
    
  });

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

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
            painter: _MiRadialProgress(
               (widget.porcentaje - diferenciaAnimar) + ( diferenciaAnimar * controller.value),
               widget.colorPrimario,
               widget.colorSecundario,
               widget.grosorPrimario,
               widget.grosorSecundario,
                ),
          ),
          
        );
      }
      );
    
  }
}
class _MiRadialProgress extends CustomPainter {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgress( 
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario,
    );
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: Offset(0, 0), 
      radius: 100.0
      );

    final Gradient gradiente = RadialGradient(
      colors: <Color>[
        Colors.red,
        Colors.purple,
        Colors.yellow
      ]
      );

    //Draw full circle.

    final paint = Paint();

    paint.color = colorPrimario;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = grosorPrimario;

    final  center = Offset(size.width * 0.5, size.height* 0.5);
    final  radio  = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Draw arc.

    final paintArco = Paint()
    ..shader = gradiente.createShader(rect)
    //..color = colorSecundario
    ..style = PaintingStyle.stroke
    ..strokeWidth = grosorSecundario
    ..strokeCap   = StrokeCap.round;

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