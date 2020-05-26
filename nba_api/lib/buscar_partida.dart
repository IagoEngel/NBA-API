import 'package:flutter/material.dart';
import 'package:nba_api/classes/time.dart';
import 'package:nba_api/jogos_controller.dart';
import 'classes/jogos.dart';

double escala = 2.7;
int pontosHome;
int pontosVisitor;

class BuscarPartida extends StatefulWidget {
  int idPartida;

  BuscarPartida({@required this.idPartida});

  @override
  _BuscarPartidaState createState() => _BuscarPartidaState();
}

class _BuscarPartidaState extends State<BuscarPartida> {
  Future<Jogos> partida;

  @override
  void initState() {
    super.initState();
    partida = BuscarDados(widget.idPartida);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent[700],
            Colors.black,
            Colors.redAccent[700],
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 70),
          Row(
            children: [
              //HOME TEAM
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    _homeTeam(context, partida),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              // VISITOR TEAM
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    _visitorTeam(context, partida),
                  ],
                ),
              ),
            ],
          ),
          _dataPartida(context, partida),
        ],
      ),
    );
  }
}

Widget _visitorTeam(BuildContext context, var partida) {
  String imagem;
  return FutureBuilder<Jogos>(
    future: partida,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        pontosVisitor = snapshot.data.ptsVisitorTeam;
        imagem = snapshot.data.visitorTeam.nomeCompleto.replaceAll(' ', '_') +
            ".png";
        return Column(
          children: [
            _conteudoPlacar(pontosVisitor),
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
            _atributosTime(snapshot.data.visitorTeam),
          ],
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

Widget _homeTeam(BuildContext context, var partida) {
  String imagem;

  return FutureBuilder<Jogos>(
    future: partida,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        pontosHome = snapshot.data.ptsHomeTeam;
        imagem =
            snapshot.data.homeTeam.nomeCompleto.replaceAll(' ', '_') + ".png";
        return Row(
          children: [
            Column(
              children: [
                _conteudoPlacar(pontosHome),
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
                _atributosTime(snapshot.data.homeTeam),
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

Widget _conteudoPlacar(int pontos) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    child: Column(
      children: [
        Text(
          '$pontos',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ],
    ),
  );
}

Widget _dataPartida(BuildContext context, var partida) {
  String data;
  return FutureBuilder<Jogos>(
    future: partida,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        data = snapshot.data.data;
        data = data.substring(8, 10) +
            "/" +
            data.substring(5, 7) +
            "/" +
            data.substring(0, 4);
        return _conteudoPartida(snapshot, data);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return LinearProgressIndicator();
    },
  );
}

Widget _conteudoPartida(AsyncSnapshot snapshot, String data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.black38,
        ),
        constraints: BoxConstraints(minWidth: 300, maxWidth: 310),
        child: Column(
          children: [
            Text('Data do jogo: $data',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Season: ${snapshot.data.temporada}',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Period: ${snapshot.data.period}',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Status: ${snapshot.data.status}',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    ],
  );
}

Widget _atributosTime(Time time) {
  return Container(
    margin: EdgeInsets.only(top: 15),
    padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
      color: Colors.black38,
    ),
    width: 150,
    child: Column(
      children: [
        //LINHA DA DIVISÃO
        Row(
          children: [
            Text('Divisão:', style: TextStyle(color: Colors.white)),
            Expanded(child: SizedBox()),
            Text('${time.divisao}', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 5),
        //LINHA DA ASSOCIAÇÃO
        Row(
          children: [
            Text('Associação:', style: TextStyle(color: Colors.white)),
            Expanded(child: SizedBox()),
            Text('${time.associacao}', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    ),
  );
}
