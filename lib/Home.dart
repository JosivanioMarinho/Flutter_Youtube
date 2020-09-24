import 'package:MyYoutube/CustomSearchDelegate.dart';
import 'package:MyYoutube/telas/Biblioteca.dart';
import 'package:MyYoutube/telas/EmAlta.dart';
import 'package:MyYoutube/telas/Incricao.dart';
import 'package:MyYoutube/telas/Inicio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceBotomNavigation = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> lista = [
      Inicio(_resultado),
      EmAlta(),
      Incricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            }
          ),

          /*IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: null
          ),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: lista[_indiceBotomNavigation],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,//shifting
        currentIndex: _indiceBotomNavigation,
        onTap: (indice){//0,1,2,3
          setState(() {
            _indiceBotomNavigation = indice;
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(//0
            //backgroundColor: Colors.red,
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(//1
            //backgroundColor: Colors.red,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(//2
            //backgroundColor: Colors.red,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(//3
            //backgroundColor: Colors.red,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}