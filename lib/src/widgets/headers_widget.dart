import 'package:flutter/material.dart';


class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      color: Color(0xFF615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      decoration: BoxDecoration(
        color: Color(0xFF615AAB),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0) ),
      ),
    );
  }
}