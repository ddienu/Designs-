import 'package:flutter/material.dart';


class PinterestButton {

  final Function onPressed;
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

      PinterestButton(icon: Icons.pie_chart, onPressed: (){ print({'$Icon.name'});}),
      PinterestButton(icon: Icons.search, onPressed: (){ print({'$Icon.name'});}),
      PinterestButton(icon: Icons.notifications, onPressed: (){ print({'$Icon.name'});}),
      PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print({'$Icon.name'});}),

    ];

    return Container(
      child: Center(
        child: Text('Hello world'),
      ),
    );
    
  }
}