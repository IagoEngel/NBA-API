import 'dart:convert';
import 'package:nba_api/classes/jogos.dart';
import 'package:http/http.dart' as http;

Future<Jogos> BuscarDados(int id) async {
  final response = await http.get('https://www.balldontlie.io/api/v1/games/$id');

  if (response.statusCode == 200){
    return Jogos.fromJson(json.decode(response.body));
  }else{
    throw Exception("Falha ao carregar o Jogo.");
  }
}