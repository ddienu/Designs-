import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

import 'package:disenos_app/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños Flutter App'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: Container(
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.lightBlueAccent,
                  child: Text('D.N', style: TextStyle( fontSize: 50.0, color: Colors.white),),
              ),
            ),

            Expanded(
              child: _ListaOpciones(),
              ),

            ListTile(
              leading: FaIcon( FontAwesomeIcons.solidLightbulb, color: Colors.blue,),
              title: Text('Dark Mode'),
              trailing: Switch(
                value: true, 
                onChanged: ( value ){

                },
                ),
            ),

            ListTile(
              leading: Icon( Icons.add_to_home_screen, color: Colors.blue),
              title: Text('Custom Mode'),
              trailing: Switch(
                value: true, 
                onChanged: ( value ){

                },
                ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      separatorBuilder: ((context, index) => Divider(
        color: Colors.blueAccent,
      )), 
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
          leading: FaIcon(pageRoutes[index].icon, color: Colors.blue,),
          title: Text(pageRoutes[index].title),
          trailing: Icon( Icons.chevron_right),
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => pageRoutes[index].page)
            );
          },
      ),
      controller: ScrollController(),
    ); 
  }
}