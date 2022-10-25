import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _ListaTareas(),
    );
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