
class Time{
  final int id;
  final String abreviacao;
  final String nomeCompleto;

  Time({this.id, this.abreviacao, this.nomeCompleto});

  factory Time.fromJson(Map<String, dynamic> json){
    return Time(
      id: json['id'],
      abreviacao: json['abbreviation'],
      nomeCompleto: json['full_name'],
    );
  }

}