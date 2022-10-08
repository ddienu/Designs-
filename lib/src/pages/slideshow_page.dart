import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  final assetName = 'assets/svgs/slide-1.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          assetName
          ),
      ),
    );
      
  }
}