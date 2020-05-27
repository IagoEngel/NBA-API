import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nba_api/buscar_partida.dart';

int id = 1;

void main() {
  runApp(NBA_API());
}

class NBA_API extends StatefulWidget {
  @override
  _NBA_APIState createState() => _NBA_APIState();
}

class _NBA_APIState extends State<NBA_API> {
  TextEditingController txtPartida = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NBA Api',
      home: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: BuscarPartida(idPartida: id),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          label: Container(
            constraints: BoxConstraints(
              maxWidth: 170,
              maxHeight: 20,
            ),
            child: TextField(
              controller: txtPartida,
              decoration: InputDecoration(
                labelText: 'Pesquisar nova partida',
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
          },
        ),
      ),
    );
  }
}
