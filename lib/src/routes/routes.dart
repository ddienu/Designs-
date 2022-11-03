import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/Slideshow_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/pages/pinterest_page.dart';
import 'package:disenos_app/src/pages/sliver_list_page.dart';
import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 


final pageRoutes = <_Routes>[
  _Routes(FontAwesomeIcons.slideshare, 'Slideshow', const SlideshowPage()),
  _Routes(FontAwesomeIcons.truckMedical, 'Emergency', const EmergencyPage()),
  _Routes(FontAwesomeIcons.heading, 'Headers', const HeadersPage()),
  _Routes(FontAwesomeIcons.peopleCarryBox, 'Cuadro Animado', const CuadradoAnimadoPage()),
  _Routes(FontAwesomeIcons.circleNotch, 'Circular Progress Indicator', const GraficasCircularesPage()),
  _Routes(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Routes(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),

];


class _Routes {


  final IconData icon;
  final String title;
  final Widget page;

  _Routes(
    this.icon, 
    this.title, 
    this.page);

}