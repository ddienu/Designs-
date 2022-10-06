import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';


class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key, this.colorBoton = Colors.blue,}) : super(key: key);
  
  final Color colorBoton;

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh),
        backgroundColor: widget.colorBoton,
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if ( porcentaje > 100){
              porcentaje = 0;
            }
          });
        }
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.black),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purpleAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.yellow),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.green),
            ],
          ),
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;
  const CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color,
  }) : super(key: key);

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      //color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: Colors.grey,
        colorSecundario: color,
        grosorPrimario: 8.0,
        grosorSecundario: 10.0,
        ),
    );
  }
}