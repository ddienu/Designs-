import 'package:flutter/material.dart';

//import 'package:disenos_app/model/Slider_model.dart';

//import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class Slideshow extends StatelessWidget {
  
  final List<Widget> slides;
  final bool puntosArriba;
  //bulletPrimario is the color of the background dot
  final Color bulletPrimario;
  //bulletSecundario is the color of the dot.
  final Color bulletSecundario;
  final double dotSize;

  const Slideshow({
    required this.slides, 
    this.puntosArriba = false, 
    this.bulletPrimario = Colors.grey,
    this.bulletSecundario = Colors.blue,
    this.dotSize = 10.0
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
                Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario;
                Provider.of<_SlideshowModel>(context).bulletSecundario = bulletSecundario;

                return Column(
              verticalDirection: ( puntosArriba == false ) ? VerticalDirection.down : VerticalDirection.up,
              children: [
                Expanded(
                  child: _Slides( slides)
                  ),
                _Dots( totalSlides: slides.length, dotSize: dotSize,),
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
  final double dotSize;

  const _Dots({required this.totalSlides,
  required this.dotSize
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
          index: i, 
          dotSize: dotSize,)
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
  final double dotSize;

  const _Dot ( { required this.index,
  required this.dotSize,
  });

  @override
  Widget build(BuildContext context) {

    //final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    final slideShowModel = Provider.of<_SlideshowModel>(context);
   

    return AnimatedContainer(
      duration: Duration( milliseconds: 200),
      margin: EdgeInsets.symmetric( horizontal: 8.0),
      height: dotSize,
      width: dotSize,
      decoration: BoxDecoration(
        color: ( slideShowModel.currentPage >= index - 0.5 && slideShowModel.currentPage <= index + 0.5) 
          ? slideShowModel.bulletSecundario
          : slideShowModel.bulletPrimario,
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

  double _currentPage     = 0;
  Color _bulletPrimario    = Colors.grey;
  Color _bulletSecundario = Colors.blue;

  double get currentPage => _currentPage;

  set currentPage ( double currentPage){
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get bulletPrimario => _bulletPrimario;

  set bulletPrimario ( Color bulletPrimario){
    _bulletPrimario = bulletPrimario;
  }

  Color get bulletSecundario => _bulletSecundario;

  set bulletSecundario ( Color bulletSecundario){
    _bulletSecundario = bulletSecundario;
  }

  
}

