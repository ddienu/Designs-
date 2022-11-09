import 'package:flutter/material.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart';

import 'package:provider/provider.dart';


class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key,}) : super(key: key);
  
  //final Color colorBoton;

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh),
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if ( porcentaje > 100){
              porcentaje = 0;
            }
          });
        }
        ),
      body: /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            //alignment: AlignmentDirectional.bottomCenter,
            children: [
              Row(
                children: [
                  CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomRadialProgress(porcentaje: porcentaje, color: Colors.black)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomRadialProgress(porcentaje: porcentaje, color: Colors.red)
                ],
              ),
             Row(
                  children: [
                    CustomRadialProgress(porcentaje: porcentaje, color: Colors.yellow)
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(left: 160, top: 47),
                child: Row(
                  children: [
                    CustomRadialProgress(porcentaje: porcentaje, color: Colors.green)
                  ],
                ),
              )
            ],
            
          )
        ],
      )*/
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.black),
              CustomRadialProgress(porcentaje: porcentaje * 1.25, color: Colors.purpleAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje * 1.5, color: Colors.yellow),
              CustomRadialProgress(porcentaje: porcentaje * 2, color: Colors.green),
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

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: 111.0,
      height: 111.0,
      //color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: appTheme.textTheme.bodyText1!.color ?? Colors.grey,
        colorSecundario: color,
        grosorPrimario: 8.0,
        grosorSecundario: 10.0,
        ),
    );
  }
}