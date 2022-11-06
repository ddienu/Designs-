import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => _MostrarMenuModel(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      )
      //PinterestMenu(),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   final mostrar = Provider.of<_MostrarMenuModel>(context).mostrar;

   final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
      bottom: 20.0,
      child: PinterestMenu(
        mostrar: mostrar, 
        backgroundColor: appTheme.scaffoldBackgroundColor,
        activeColor: appTheme.colorScheme.secondary, 
        inactiveColor: Colors.grey,
        items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: (){ print({'Icon pie_chart'});}),
                PinterestButton(icon: Icons.search, onPressed: (){ print({'Icon search'});}),
                PinterestButton(icon: Icons.notifications, onPressed: (){ print({'Icon notifications'});}),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print({'Icon supervised'});}),
        ],
        ),
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
        Provider.of<_MostrarMenuModel>(context, listen: false).mostrar = false;
      }else{
        Provider.of<_MostrarMenuModel>(context, listen: false).mostrar = true;
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

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: appTheme.colorScheme.secondary,
          child: Text('$index'),
        ),
      ),
    );
    
  }
}

class _MostrarMenuModel with ChangeNotifier{

  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar ( bool mostrar){
    _mostrar = mostrar;
    notifyListeners();
  }
}

