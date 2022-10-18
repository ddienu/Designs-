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

  late final Color backgroundColor;

  late final Color activeColor;

  late final Color inactiveColor;

  PinterestMenu(
    {this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey} 
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
        child: Builder(
          builder: (BuildContext context) { 
            
            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor     = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor   = this.inactiveColor;

            return _PinterestMenuBackground(
            child: _MenuItems( menuItems: items)
            );
           },
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

    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: backgroundColor,
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

    final menuModelProperties = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon( 
          item.icon, 
          color: ( itemSeleccionado == index) ? menuModelProperties.activeColor : menuModelProperties.inactiveColor,
          size: ( itemSeleccionado == index) ? 35 : 25,
          ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado ( int itemSeleccionado){
    _itemSeleccionado = itemSeleccionado;
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;

  set backgroundColor ( Color backgroundColor){
    _backgroundColor = backgroundColor;
   // notifyListeners();
  }

  Color get activeColor => _activeColor;

  set activeColor ( Color activeColor){
    _activeColor = activeColor;
   // notifyListeners();
  }

  
  Color get inactiveColor => _inactiveColor;

  set inactiveColor ( Color inactiveColor){
    _inactiveColor = inactiveColor;
   // notifyListeners();
  }




}