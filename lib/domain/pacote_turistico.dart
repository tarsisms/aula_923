class PacoteTuristico {
  late int id;
  late String urlImagem;
  late String tituloAno;
  late String titulo;
  late String cidade;
  late String validade;
  late String descricao;
  late int numPessoas;
  late int desconto;
  late int numDiarias;
  late double valorAntigo;
  late double valorAtual;

  PacoteTuristico({
    required this.urlImagem,
    required this.titulo,
    required this.cidade,
    required this.validade,
    required this.descricao,
    required this.numPessoas,
    required this.numDiarias,
    required this.valorAntigo,
    required this.valorAtual,
  });

  PacoteTuristico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    tituloAno = json['titulo_ano'];
    urlImagem = json['url_image'];
    cidade = json['cidade'];
    descricao = json['descricao'];
    validade = json['validade'];
    desconto = json['desconto'];
    numDiarias = json['num_diarias'];
    numPessoas = json['num_pessoas'];
    valorAntigo = json['valor_antigo'];
    valorAtual = json['valor_atual'];
  }
}
