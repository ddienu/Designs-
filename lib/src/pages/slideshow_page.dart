import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Slideshow()
    );
    
  }
}