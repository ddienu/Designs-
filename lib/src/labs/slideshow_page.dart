import 'package:disenos_app/model/Slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: _Slides()
                ),
              _Dots(),
            ],
          )
        ),
      ),
    );
      
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        //color: Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(index: 0),
          _Dot(index: 1,),
          _Dot(index: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot ( { required this.index});

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration( milliseconds: 200),
      margin: EdgeInsets.symmetric( horizontal: 8.0),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: ( pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5) 
          ? Colors.blue 
          : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {

    //print( 'Actual Page: ${pageViewController.page}');

    Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;

     });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: pageViewController,
        children: [
          const _Slide( 'assets/svgs/slide-1.svg' ),
          const _Slide( 'assets/svgs/slide-2.svg' ),
          const _Slide( 'assets/svgs/slide-3.svg' ),
          
        ],
      ),
    );
    
  }
}

class _Slide extends StatelessWidget {

  final String svg;
  
  const _Slide (this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding : EdgeInsets.all(30.0),
      child: SvgPicture.asset( svg ),
    );
  }
}