import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _Titulo(),
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
  const _ListaTareas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) { 
        return _ListItem();
       },


    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all( 25.0),
      alignment: Alignment.centerLeft,
      child: Text('Orange', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, )),
      margin: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular( 25.0 ),
      ),
    );
  }
}