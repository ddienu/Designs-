import 'package:flutter/material.dart';

//import 'package:disenos_app/model/Slider_model.dart';

//import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class Slideshow extends StatelessWidget {
  
  final List<Widget> slides;
  final bool puntosArriba;
  //colorPrimario is the color of the background dot
  final Color colorPrimario;
  //colorSecundario is the color of the dot.
  final Color colorSecundario;
  //bulletPrimario is when the dot is selected.
  final double bulletPrimario;
  //bulletSecundario is when the dot is not selected or have the colorPrimario.
  final double bulletSecundario;

  const Slideshow({
    required this.slides, 
    this.puntosArriba     = false, 
    this.colorPrimario    = Colors.grey,
    this.colorSecundario  = Colors.blue,
    this.bulletPrimario   = 15.0,
    this.bulletSecundario = 12.0,
    }
    );

  @override
  Widget build(BuildContext context){
      
  return ChangeNotifierProvider(
    create: (_) => _SlideshowModel(),
    child: SafeArea(
      child: Center(
            child: Builder(
              builder: (BuildContext context) { 
                Provider.of<_SlideshowModel>(context).colorPrimario    = colorPrimario;
                Provider.of<_SlideshowModel>(context).colorSecundario  = colorSecundario;

                Provider.of<_SlideshowModel>(context).bulletPrimario   = bulletPrimario;
                Provider.of<_SlideshowModel>(context).bulletSecundario = bulletSecundario;

                return Column(
              verticalDirection: ( puntosArriba == false ) ? VerticalDirection.down : VerticalDirection.up,
              children: [
                Expanded(
                  child: _Slides( slides)
                  ),
                _Dots( totalSlides: slides.length,),
              ],
            );
               },

            )
          ),
    ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  const _Dots({required this.totalSlides,
  });

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
        children: List.generate(totalSlides, (i) => _Dot( 
          index: i)
          ),
        // children: [
        //   _Dot(index: 0),
        //   _Dot(index: 1,),
        //   _Dot(index: 2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot ( { required this.index,
  });

  @override
  Widget build(BuildContext context) {


    //final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    final slideShowModel = Provider.of<_SlideshowModel>(context);

    final double size;
    final Color color;
   
    if ( slideShowModel.currentPage >= index - 0.5 && slideShowModel.currentPage <= index + 0.5){
      size = slideShowModel.bulletPrimario;
      color  = slideShowModel.colorSecundario;
    }else{
      size = slideShowModel.bulletSecundario;
      color  = slideShowModel.colorPrimario;
    }

    return AnimatedContainer(
      duration: Duration( milliseconds: 200),
      margin: EdgeInsets.symmetric( horizontal: 8.0),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides; 
  
  const _Slides( this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
    Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
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
        // children: [
        //   const _Slide( 'assets/svgs/slide-1.svg' ),
        //   const _Slide( 'assets/svgs/slide-2.svg' ),
        //   const _Slide( 'assets/svgs/slide-3.svg' ),
        //],
        children: widget.slides.map( ( slide ) => _Slide( slide)).toList(),
      ),
    );
    
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;
  
  const _Slide (this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding : EdgeInsets.all(30.0),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier{

  double _currentPage      = 0;
  Color _colorPrimario     = Colors.grey;
  Color _colorSecundario   = Colors.blue;
  double _bulletPrimario   = 15.0;
  double _bulletSecundario = 12.0;

  double get currentPage => _currentPage;

  set currentPage ( double currentPage){
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario ( Color colorPrimario){
    _colorPrimario = colorPrimario;
  }

  Color get colorSecundario => _colorSecundario;

  set colorSecundario ( Color colorSecundario){
    _colorSecundario = colorSecundario;
  }

  double get bulletPrimario => _bulletPrimario;

  set bulletPrimario ( double bulletPrimario ){
    _bulletPrimario = bulletPrimario;
    //notifyListeners();
  }

  double get bulletSecundario => _bulletSecundario;

  set bulletSecundario ( double bulletSecundario){
    _bulletSecundario = bulletSecundario;
    //notifyListeners();
  }

  
}

