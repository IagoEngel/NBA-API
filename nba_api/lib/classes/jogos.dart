import 'package:nba_api/classes/time.dart';


class Jogos{
  final int id;
  final String data;
  final int ptsHomeTeam;
  final int ptsVisitorTeam;
  final Time homeTeam;
  final Time visitorTeam;

  Jogos({
    this.id,
    this.data,
    this.homeTeam,
    this.ptsHomeTeam,
    this.ptsVisitorTeam,
    this.visitorTeam,
  });

  factory Jogos.fromJson(Map<String, dynamic> json){
    return Jogos(
      id: json['id'],
      data: json['date'],
      ptsHomeTeam: json['home_team_score'],
      ptsVisitorTeam: json['visitor_team_score'],
      homeTeam: Time.fromJson(json['home_team']),
      visitorTeam: Time.fromJson(json['visitor_team']),
    );
  }

}