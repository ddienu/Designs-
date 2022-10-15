import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: PinterestMenu(),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {

  final List<int> items = List.generate(200, (i) => i);
 
  @override
  Widget build(BuildContext context) {
 
    return GridView.custom(
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

