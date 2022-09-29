import 'package:flutter/material.dart';



class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotacion;

  @override

  void initState() {
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration( milliseconds: 4000),
      );

      rotacion = Tween(begin: 0.0, end: 2.0).animate(controller);
      
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Play button
    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      builder: (BuildContext context, Widget? child){


        print (rotacion.value);

        return  Transform.rotate
        (angle: rotacion.value,
        child: const Cuadrado());
      }
      );
  }
}


class Cuadrado extends StatelessWidget {
  const Cuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}