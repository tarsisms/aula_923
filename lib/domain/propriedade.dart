class Propriedade {
  late String urlImage;
  late String local;
  late String tipoDeHost;
  late String datas;
  late double valor;
  late double avaliacao;

  Propriedade({
    required this.urlImage,
    required this.local,
    required this.avaliacao,
    required this.tipoDeHost,
    required this.datas,
    required this.valor,
  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    valor = json['valor'];
    avaliacao = json['avaliacao'];
    datas = json['datas'];
    local = json['local'];
    tipoDeHost = json['tipoDeHost'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['valor'] = this.valor;
    data['avaliacao'] = this.avaliacao;
    data['datas'] = this.datas;
    data['local'] = this.local;
    data['tipoDeHost'] = this.tipoDeHost;
    data['urlImage'] = this.urlImage;
    return data;
  }
}
