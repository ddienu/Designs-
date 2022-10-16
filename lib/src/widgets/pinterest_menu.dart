import 'package:flutter/material.dart';


class PinterestButton {

  final Function() onPressed;
  final IconData icon;


  PinterestButton({
  required this.icon,
  required this.onPressed,
  });
}

class PinterestMenu extends StatelessWidget {
  const PinterestMenu({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    final List<PinterestButton> items = [

      PinterestButton(icon: Icons.pie_chart, onPressed: (){ print({'Icon pie_chart'});}),
      PinterestButton(icon: Icons.search, onPressed: (){ print({'Icon search'});}),
      PinterestButton(icon: Icons.notifications, onPressed: (){ print({'Icon notifications'});}),
      PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print({'Icon supervised'});}),

    ];

    return Center(
      child: _PinterestMenuBackground(child: _MenuItems( menuItems: items)),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child; 

  const _PinterestMenuBackground({

    required this.child,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: -5,
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  const _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton( index: index, item: menuItems[index]))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({
    required this.index, 
    required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon( 
          item.icon, 
          color: Colors.blueGrey,
          size: 25.0,
          ),
      ),
    );
  }
}