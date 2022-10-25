import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/sliver_list_page.dart';

//import 'package:disenos_app/src/pages/emergency_page.dart';
//import 'package:disenos_app/src/labs/slideshow_page.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_app/src/pages/headers_page.dart';
// import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';
//import 'package:disenos_app/src/pages/Slideshow_page.dart';
//import 'package:disenos_app/src/pages/pinterest_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: SliverListPage(),
    );
  }
}