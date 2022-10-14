import 'dart:ui';

import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Slideshow(
              bulletPrimario: 15.0,
              bulletSecundario: 12.0,
              colorPrimario: Colors.grey,
              colorSecundario: Colors.pink,
              puntosArriba: false,
              slides: [
              SvgPicture.asset('assets/svgs/slide-1.svg' ),
              SvgPicture.asset('assets/svgs/slide-2.svg' ),
              SvgPicture.asset('assets/svgs/slide-3.svg' ),
              SvgPicture.asset('assets/svgs/slide-4.svg' ),
              SvgPicture.asset('assets/svgs/slide-5.svg' ),
            ],
          ),
        ),
          Expanded(
            child: Slideshow(
              bulletPrimario: 15.0,
              bulletSecundario: 12.0,
              colorPrimario: Colors.grey,
              colorSecundario: Colors.black,
              puntosArriba: true,
              slides: [
              Image.network('https://i.ytimg.com/vi/tshXzKpgZWs/hqdefault.jpg'),
              Center(child: Text('Table Tennis 4 All', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)),
              Image.network('https://tabletennis-reference.com/images/racket/935_1_450.jpg'),
              ],))
        ],
      ),
    );
    
  }
}