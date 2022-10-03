import 'package:flutter/material.dart';

import 'dart:math';



class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(4.0),
          height: 300.0,
          width: 300.0,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress( 50 ),
          ),
        ),
      ),
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