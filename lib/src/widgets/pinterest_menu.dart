import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class PinterestButton {

  final Function() onPressed;
  final IconData icon;


  PinterestButton({
  required this.icon,
  required this.onPressed,
  });
}

class PinterestMenu extends StatelessWidget {
  
  late final bool mostrar;

  PinterestMenu(
    {this.mostrar = true} 
    );
  

  @override
  Widget build(BuildContext context) {

    final List<PinterestButton> items = [

      PinterestButton(icon: Icons.pie_chart, onPressed: (){ print({'Icon pie_chart'});}),
      PinterestButton(icon: Icons.search, onPressed: (){ print({'Icon search'});}),
      PinterestButton(icon: Icons.notifications, onPressed: (){ print({'Icon notifications'});}),
      PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print({'Icon supervised'});}),

    ];

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration( milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: _PinterestMenuBackground(
          child: _MenuItems( menuItems: items)
          ),
      ),
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

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon( 
          item.icon, 
          color: ( itemSeleccionado == index) ? Colors.black : Colors.blueGrey,
          size: ( itemSeleccionado == index) ? 35 : 25,
          ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado ( int itemSeleccionado){
    _itemSeleccionado = itemSeleccionado;
    notifyListeners();

  }


}