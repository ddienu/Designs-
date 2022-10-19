import 'dart:ui';

import 'package:flutter/material.dart';


class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      color: Color(0xFF615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      decoration: BoxDecoration(
        color: Color(0xFF615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0), 
          bottomRight: Radius.circular(50.0) 
          ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),

    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    //Properties
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    //paint.strokeWidth = 10.0;

    final path = Path();

    //Draw with the path and paint.
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),

    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
   
    final paint = Paint();

    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;

    final path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;    
  }
}

class HeaderZigZig extends StatelessWidget {
  const HeaderZigZig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderZigZagPainter(),
      )
    );
  }
}

class _HeaderZigZagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   
   final paint = Paint();

   paint.color = const Color(0xFF615AAB);
   paint.style = PaintingStyle.fill;

   final path = Path();

   path.lineTo(size.width, 0);
   path.lineTo(size.width * 0.3, size.height * 0.5);
   path.lineTo(size.width, size.height);
   path.lineTo(0, size.height);

   canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   
   final paint = Paint();

   paint.color = Color(0xFF615AAB);
   paint.style = PaintingStyle.fill;

   final path = Path();

   path.lineTo(0, size.height * 0.3);
   path.lineTo(size.width * 0.5, size.height * 0.4);
   path.lineTo(size.width, size.height * 0.3);
   path.lineTo(size.width, 0);


   canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      )
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;

    final path = Path();

    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);



    canvas.drawPath(path, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomWave extends StatelessWidget {
  const BottomWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _BottomWavePainter(),
      ),
    );
  }
}

class _BottomWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10.0;

    final path = Path();

    path.moveTo(0, size.height * 0.7);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.76, size.width * 0.5, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.65, 0, size.height* 0.7);


    canvas.drawPath(path, paint);
    
    }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWavesGradient extends StatelessWidget {
  const HeaderWavesGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesGradientPainter(),
      ),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: Offset(155.0, 65.0), 
      radius: 120.0,
      );

    final Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors:<Color>[
        Color(0xFF6D05E8),
        Color(0xFFC012FF),
        Color(0xFF6D05FA),
      ]
      );

    final paint = Paint().. shader = gradiente.createShader(rect);

    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, paint);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; 
  }
  }

class IconHeader extends StatelessWidget {
  const IconHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff526BF6),
            Color(0xff67ACF2),
            
          ] 
          )
      ),
    );
    
  }
}