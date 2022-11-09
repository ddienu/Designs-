import 'package:flutter/material.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme    = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    // bool isLarge;
    // if ( MediaQuery.of(context).size.height > 500){
    //   isLarge = true;
    // }else{
    //   isLarge = false;
    // }

    bool isLarge = (MediaQuery.of(context).size.height > 500);

    final children = [
          Expanded(
            child: _MiSlideShow1(accentColor: accentColor),
        ),
          Expanded(
            child: _MiSlideShow2(accentColor: accentColor))
        ];

    return Scaffold(
      body: (isLarge)
          ? Column(
            children: children,
          )
          : Row(
            children: children,
          )
    );
    
  }
}


class _MiSlideShow1 extends StatelessWidget {
  const _MiSlideShow1({
    Key? key,
    required this.accentColor,
  }) : super(key: key);

  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15.0,
      bulletSecundario: 12.0,
      colorPrimario: Colors.grey,
      colorSecundario: accentColor,
      puntosArriba: false,
      slides: [
      SvgPicture.asset('assets/svgs/slide-1.svg' ),
      SvgPicture.asset('assets/svgs/slide-2.svg' ),
      SvgPicture.asset('assets/svgs/slide-3.svg' ),
      SvgPicture.asset('assets/svgs/slide-4.svg' ),
      SvgPicture.asset('assets/svgs/slide-5.svg' ),
    ],
          );
  }
}

class _MiSlideShow2 extends StatelessWidget {
  const _MiSlideShow2({
    Key? key,
    required this.accentColor,
  }) : super(key: key);

  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15.0,
      bulletSecundario: 12.0,
      colorPrimario: Colors.grey,
      colorSecundario: accentColor,
      puntosArriba: true,
      slides: [
      Image.network('https://i.ytimg.com/vi/tshXzKpgZWs/hqdefault.jpg'),
      Center(child: Text('Table Tennis 4 All', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)),
      Image.network('https://tabletennis-reference.com/images/racket/935_1_450.jpg'),
      ],);
  }
}