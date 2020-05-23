import 'package:flutter/material.dart';
import 'package:nba_api/jogos_controller.dart';
import 'classes/jogos.dart';

double escala = 2.7;

class BuscarPartida extends StatefulWidget {
  @override
  _BuscarPartidaState createState() => _BuscarPartidaState();
}

class _BuscarPartidaState extends State<BuscarPartida> {
  Future<Jogos> partida;

  @override
  void initState() {
    super.initState();
    partida = BuscarDados();
  }

  @override
  Widget build(BuildContext context) {
    int pontosHome, pontosVisitor;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent[700], Colors.black, Colors.redAccent[700]],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 70),
          Row(
            children: [
              //HOME TEAM
              _homeTeam(context, partida, pontosHome),
              Expanded(child: SizedBox()),
              // VISITOR TEAM
              _visitorTeam(context, partida, pontosVisitor),
            ],
          ),
          Row(
            children: [
              _conteudoPlacar(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _visitorTeam(BuildContext context, var partida, int pontos) {
  String imagem;
  return FutureBuilder<Jogos>(
    future: partida,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        pontos = snapshot.data.ptsVisitorTeam;
        imagem = snapshot.data.visitorTeam.nomeCompleto.replaceAll(' ', '_') +
            ".png";
        return Column(
          children: [
            Image.asset(
              'assets/images/$imagem',
              scale: escala,
            ),
            Text(
              "${snapshot.data.visitorTeam.nomeCompleto}",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              "${snapshot.data.visitorTeam.abreviacao}",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

Widget _homeTeam(BuildContext context, var partida, int pontos) {
  String imagem;

  return FutureBuilder<Jogos>(
    future: partida,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        pontos = snapshot.data.ptsHomeTeam;
        imagem =
            snapshot.data.homeTeam.nomeCompleto.replaceAll(' ', '_') + ".png";
        return Row(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/$imagem',
                  scale: escala,
                ),
                Text(
                  "${snapshot.data.homeTeam.nomeCompleto}",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  "${snapshot.data.homeTeam.abreviacao}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ],
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

Widget _conteudoPlacar(){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      children: [
        
      ],
    ),
  );
}