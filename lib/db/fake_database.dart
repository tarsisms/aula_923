import 'package:aula_923/domain/propriedade.dart';

class FakeDatabase {
  static List listaPropriedades = [
    Propriedade(
      urlImage:
          'https://www.envoyage.com/sites/default/files/styles/full_size/public/Dest_Netherlands_Landing.jpg?itok=AXtp56Mm',
      local: 'Harlingen, Netherlands',
      dates: '18 - 23 Dec',
      host: 'Professional Host',
      total: '\$1,068 total',
    ),
    Propriedade(
      urlImage:
          'https://blog.theifriend.com/wp-content/uploads/2021/11/guia-de-viagem-maragogi-al-piscinas-naturais-990x556.png',
      local: 'Maragogi, Brazil',
      host: 'Professional Host',
      dates: '10 Jan - 31 Dec',
      total: '\$5,200 total',
    ),
    Propriedade(
      urlImage:
          'https://www.topensandoemviajar.com/wp-content/uploads/2023/08/melhores-dicas-fazer-fortaleza-ceara.jpg',
      local: 'Fortaleza, Brazil',
      host: 'Professional Host',
      dates: '01-12 Jun',
      total: '\$1,200 total',
    ),
    Propriedade(
      urlImage:
          'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-paris-capa2019-02.jpg',
      local: 'Paris, FRA',
      host: 'Professional Host',
      dates: '01-12 Jun',
      total: '\$1,200 total',
    ),
  ];
}
