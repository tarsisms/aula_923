class Propriedade {
  late String urlImage;
  late String local;
  late String dates;
  late String host;
  late String total;

  Propriedade({
    required this.urlImage,
    required this.local,
    required this.dates,
    required this.host,
    required this.total,
  });

  // Named Constructor - Construtor Nomeado
  Propriedade.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // avaliacao = json['avaliacao'];
    total = json['total'].toString();
    dates = json['dates'];
    local = json['local'];
    host = json['host'];
    urlImage = json['urlImagem'];
  }

  // urlImage:
  // 'https://www.envoyage.com/sites/default/files/styles/full_size/public/Dest_Netherlands_Landing.jpg?itok=AXtp56Mm',
  // local: 'Harlingen, Netherlands',
  // dates: '18 - 23 Dec',
  // host: 'Professional Host',
  // total: '\$1,068 total',
}
