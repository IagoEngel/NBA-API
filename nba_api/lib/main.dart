import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nba_api/buscar_partida.dart';

void main() {
  runApp(NBA_API());
}

class NBA_API extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NBA Api',
      home: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: BuscarPartida(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          label: Text('Pesquisar novo jogo',style: TextStyle(color: Colors.black),),
          icon: Icon(Icons.search,color: Colors.black,),
          onPressed: () {},
        ),
      ),
    );
  }
}
