class PacoteTuristico {
  final String imagem;
  final int desconto;
  final String titulo;
  final int numDiarias;
  final int numPessoas;
  final int valorAntigo;
  final int valorAtual;
  final String descricao;

  const PacoteTuristico({
    required this.imagem,
    required this.titulo,
    required this.descricao,
    required this.numDiarias,
    required this.numPessoas,
    required this.valorAntigo,
    required this.valorAtual,
    required this.desconto,
  }) ;
}
