class Time {
  final String abreviacao;
  final String associacao;
  final String divisao;
  final String nomeCompleto;

  Time({
    this.abreviacao,
    this.associacao,
    this.divisao,
    this.nomeCompleto,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      abreviacao: json['abbreviation'],
      associacao: json['conference'],
      divisao: json['division'],
      nomeCompleto: json['full_name'],
    );
  }
}
