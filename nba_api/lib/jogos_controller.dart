import 'dart:convert';
import 'package:nba_api/classes/jogos.dart';
import 'package:http/http.dart' as http;

Future<Jogos> BuscarDados() async {
  final response = await http.get('https://www.balldontlie.io/api/v1/games/1');

  if (response.statusCode == 200){
    return Jogos.fromJson(json.decode(response.body));
  }else{
    throw Exception("Falha ao carregar o Jogo.");
  }
}

Future<Jogos> criarJogo(int id) async {
  final response = await http.post(
    'https://www.balldontlie.io/api/v1/games',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    } , 
    body: jsonEncode(<String, int>{'id': id}),
  );

  if(response.statusCode == 201){
    return Jogos.fromJson(json.decode(response.body));
  }else{
    throw Exception("Falha ao criar o Jogo.");
  }
}