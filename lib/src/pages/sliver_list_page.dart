import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';


class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),

          _ButtonNewList(),
        ],
      ),
      //body: _Titulo(),
      //body: _ListaTareas(),
    );
  }
}
class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final appTheme = Provider.of<ThemeChanger>(context);
    return Positioned(
      right: 0,
      bottom: 0,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular( 50.0),
          )
        ),
        height: 90.0,
        minWidth: size.width * 0.9,
        color: ( appTheme.darkMode) ? appTheme.currentTheme.colorScheme.secondary : Color(0xFFED6762),
        onPressed: (){},
        child: Text('CREATE NEW LIST', 
          style: TextStyle( 
            color: appTheme.currentTheme.scaffoldBackgroundColor, 
            fontWeight: FontWeight.bold, 
            fontSize: 15.0, 
            letterSpacing: 3.0
            ),
          )
        ),
    );
    
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

   final items = [
    const _ListItem( titulo: 'Orange',        color: Color(0xffF08F66), colorDark: Color(0xFFBB86F8) ),
    const _ListItem( titulo: 'Family',        color: Color(0xffF2A38A), colorDark: Color(0xFF3700B3) ),
    const _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5), colorDark: Color(0xFF03DAC6) ),
    const _ListItem( titulo: 'Books',         color: Color(0xffFCEBAF), colorDark: Color(0xFFBB86F8) ),
    const _ListItem( titulo: 'Orange',        color: Color(0xffF08F66), colorDark: Color(0xFF3700B3) ),
    const _ListItem( titulo: 'Family',        color: Color(0xffF2A38A), colorDark: Color(0xFF03DAC6) ),
    const _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5), colorDark: Color(0xFFBB86F8) ),
    const _ListItem( titulo: 'Books',         color: Color(0xffFCEBAF), colorDark: Color(0xFF3700B3) ),
  ];

    return CustomScrollView(
      slivers: [
        
        // SliverAppBar(
        //   title: _Titulo(),
        //   backgroundColor: Colors.white,
        //   toolbarHeight: 140.0,
        //   elevation: 0.0,
        //   floating: true,
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 100.0,
            maxHeight: 120.0,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              child: _Titulo()),
            
          ),
          ),
        
        SliverList(
          delegate: SliverChildListDelegate( 
            [
              ...items,

              SizedBox( height: 100.0,)
              ] 
              )
          )

      ],
    );
    
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight, 
    required this.maxHeight,
    required this.child
    });
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [

        Container(
          margin: EdgeInsets.only(left: 20.0),
          alignment: Alignment.bottomLeft,
          child: Text('New', 
            style: TextStyle(
              color: ( appTheme.darkMode )? Colors.grey : Color(0xFF532128), 
              fontSize: 30.0 ),
          ),
        ),

        Stack(
          children: [
            Container(
              margin: EdgeInsets.only( left: 20.0),
              alignment: Alignment.topLeft,
              child: Text('List', style: TextStyle( color: Color(0xFFD93A30), fontSize: 30.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)
              ),
            
            
          ],
        )
      ],
    );
    
  }
}

class _ListaTareas extends StatelessWidget {
  
  final items = [
    const _ListItem( titulo: 'Orange',        color: Color(0xffF08F66), colorDark: Color(0xFFBB86F8) ),
    const _ListItem( titulo: 'Family',        color: Color(0xffF2A38A), colorDark: Color(0xFF3700B3) ),
    const _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5), colorDark: Color(0xFF03DAC6) ),
    const _ListItem( titulo: 'Books',         color: Color(0xffFCEBAF), colorDark: Color(0xFFBB86F8) ),
    const _ListItem( titulo: 'Orange',        color: Color(0xffF08F66), colorDark: Color(0xFF3700B3) ),
    const _ListItem( titulo: 'Family',        color: Color(0xffF2A38A), colorDark: Color(0xFF03DAC6) ),
    const _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5), colorDark: Color(0xFFBB86F8) ),
    const _ListItem( titulo: 'Books',         color: Color(0xffFCEBAF), colorDark: Color(0xFF3700B3) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) { 
        return items[index];
       },


    );
  }
}

class _ListItem extends StatelessWidget {

  final String titulo;
  final Color color; 
  final Color colorDark;
  
  const _ListItem({
    required this.titulo, 
    required this.color, 
    required this.colorDark,
  });

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      padding: EdgeInsets.all( 25.0),
      alignment: Alignment.centerLeft,
      child: Text(titulo, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, )),
      margin: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: (appTheme.darkMode) ? colorDark : color,
        borderRadius: BorderRadius.circular( 25.0 ),
      ),
    );
  }
}