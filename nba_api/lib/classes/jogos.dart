import 'package:nba_api/classes/time.dart';


class Jogos{
  final int id;
  final String data;
  final int ptsHomeTeam;
  final int ptsVisitorTeam;
  final int temporada;
  final int period;
  final String status;
  final Time homeTeam;
  final Time visitorTeam;

  Jogos({
    this.id,
    this.data,
    this.ptsHomeTeam,
    this.ptsVisitorTeam,
    this.temporada,
    this.period,
    this.status,
    this.homeTeam,
    this.visitorTeam,
  });

  factory Jogos.fromJson(Map<String, dynamic> json){
    return Jogos(
      id: json['id'],
      data: json['date'],
      ptsHomeTeam: json['home_team_score'],
      ptsVisitorTeam: json['visitor_team_score'],
      temporada: json['season'],
      period: json['period'],
      status: json['status'],
      homeTeam: Time.fromJson(json['home_team']),
      visitorTeam: Time.fromJson(json['visitor_team']),
    );
  }

}