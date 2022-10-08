import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_app/src/pages/headers_page.dart';
// import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: SlideShowPage(),
    );
  }
}