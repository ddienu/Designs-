import 'package:flutter/material.dart';


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
        color: Color(0xFFED6762),
        onPressed: (){},
        child: Text('CREATE NEW LIST', 
          style: TextStyle( 
            color: Colors.white, 
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

   final items = [
    const _ListItem( titulo: 'Orange',        color: Color(0xffF08F66) ),
    const _ListItem( titulo: 'Family',        color: Color(0xffF2A38A) ),
    const _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( titulo: 'Books',         color: Color(0xffFCEBAF) ),
    const _ListItem( titulo: 'Orange',        color: Color(0xffF08F66) ),
    const _ListItem( titulo: 'Family',        color: Color(0xffF2A38A) ),
    const _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( titulo: 'Books',         color: Color(0xffFCEBAF) ),
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
              color: Colors.white,
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
    return Column(
      children: [

        Container(
          margin: EdgeInsets.only(left: 20.0),
          alignment: Alignment.bottomLeft,
          child: Text('New', style: TextStyle(color: Color(0xFF532128), fontSize: 30.0 ),
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
    const _ListItem( titulo: 'Orange',        color: Color(0xffF08F66) ),
    const _ListItem( titulo: 'Family',        color: Color(0xffF2A38A) ),
    const _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( titulo: 'Books',         color: Color(0xffFCEBAF) ),
    const _ListItem( titulo: 'Orange',        color: Color(0xffF08F66) ),
    const _ListItem( titulo: 'Family',        color: Color(0xffF2A38A) ),
    const _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( titulo: 'Books',         color: Color(0xffFCEBAF) ),
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
  
  const _ListItem({
    required this.titulo, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all( 25.0),
      alignment: Alignment.centerLeft,
      child: Text(titulo, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, )),
      margin: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular( 25.0 ),
      ),
    );
  }
}