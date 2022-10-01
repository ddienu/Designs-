import 'package:flutter/material.dart';
import 'dart:math' as Math;



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
  late Animation<double> opacidad;
  late Animation<double> moverDerecha;
  late Animation<double> moverFrente;

  @override

  void initState() {
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration( milliseconds: 4000),
      );

      rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
        CurvedAnimation(
          parent: controller, 
          curve: Curves.easeInOutBack
          )
      );

      opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
          parent: controller, 
          curve: Interval(0, 0.5, curve: Curves.easeOut),
          )
          );

      moverDerecha = Tween(begin: 0.0, end: 120.0).animate(
        CurvedAnimation(
          parent: controller, 
          curve: Curves.easeOut)
       );

      moverFrente = Tween(begin:0.0, end: 2.0).animate( controller );

      //To check the status of the controller.
      controller.addListener(() {

        print('Status: ${controller.status}');

       if(controller.status == AnimationStatus.completed){
        controller.reverse();
       }
       });
      
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
      child: const Cuadrado(),
      builder: (BuildContext context, Widget? child){

        return  Transform.scale(
          scale: moverFrente.value,
          child: Transform.translate(
            offset: Offset(moverDerecha.value, 0),
            child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value,
              child: child,
              )
            ),
          ),
        );
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