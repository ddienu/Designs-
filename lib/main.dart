import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

// import 'package:disenos_app/src/pages/sliver_list_page.dart';
//import 'package:disenos_app/src/pages/emergency_page.dart';
//import 'package:disenos_app/src/labs/slideshow_page.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_app/src/pages/headers_page.dart';
// import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';
//import 'package:disenos_app/src/pages/Slideshow_page.dart';
//import 'package:disenos_app/src/pages/pinterest_page.dart';

void main() => runApp(
  MultiProvider(
    providers: [
    ChangeNotifierProvider<ThemeChanger>(
      create: ((context) => ThemeChanger( 2 )
      )
    ), 
    ChangeNotifierProvider(
      create: ((context) => LayoutModel()
      ) 
    ), 
  ],
      child: const MyApp()),
  );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) { 

          final screenSize = MediaQuery.of(context).size;

          print( screenSize );

          if ( screenSize.width > 500 ){
            return LauncherTabletPage();
          }else{
            return LauncherPage();
          }

         },
      )
    );
  }
}