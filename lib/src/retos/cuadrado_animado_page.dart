import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      )
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;
  

  @override
  void initState() {

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
      );

      moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(
          parent: controller, 
          curve: Interval(0.0, 0.25, curve: Curves.bounceOut))
      );

      moverArriba = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(
          parent: controller, 
          curve: Interval(0.26, 0.5, curve: Curves.bounceOut))
      );
      moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(
          parent: controller, 
          curve: Interval(0.51, 0.75, curve: Curves.bounceOut))
      );
      moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(
          parent: controller, 
          curve: Interval(0.76, 1.0, curve: Curves.bounceOut))
      );

      controller.addListener(() {

        if ( controller.status == AnimationStatus.completed){
          controller.reset();
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

    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      child: const _Cuadrado(),
      builder: (BuildContext context, Widget? child){


        return Transform.translate(
          offset: Offset(0, moverAbajo.value),
          child: Transform.translate(
            offset: Offset(moverIzquierda.value, 0),
            child: Transform.translate(
              offset: Offset(0, moverArriba.value),
              child: Transform.translate(
                offset: Offset(moverDerecha.value, 0),
                child: child,
                ),
            ),
          ),
        );
      }
      );
  }
}

class _Cuadrado extends StatelessWidget {
  const _Cuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      height: 70.0,
      width: 70.0,
      decoration: BoxDecoration(
        color: appTheme.currentTheme.colorScheme.secondary,
      ),
    );
  }
}