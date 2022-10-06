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
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          //color: Colors.red,
          child: RadialProgress(
            porcentaje: porcentaje,
            colorPrimario: Colors.grey,
            colorSecundario: Colors.purple,
            grosorPrimario: 10.0,
            grosorSecundario: 10.0,
            ),
        )
        ),
    );
  }
}