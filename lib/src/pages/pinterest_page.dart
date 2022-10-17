import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PinterestGrid(),
          Positioned(
            child: PinterestMenu(),
            bottom: 20.0,
            ),
        ],
      )
      //PinterestMenu(),
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (i) => i);

  ScrollController controller = ScrollController();

  double scrollAnterior = 0;

  @override
  void initState() {
    
    controller.addListener(() {
      
      if ( controller.offset > scrollAnterior){
        print('Ocultar menu');
      }else{
        print('Mostrar menu');
      }

      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    
    controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 
    return GridView.custom(
      controller: controller,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [
          QuiltedGridTile(3, 2),
          QuiltedGridTile(2, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _PinterestItem( index: index,),
        childCount: items.length
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;
  
  const _PinterestItem({required this.index});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
    
  }
}

