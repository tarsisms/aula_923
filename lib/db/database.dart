import 'package:aula_923/domain/pacote_turistico.dart';

class Database {
  static List pacotes = [
    PacoteTuristico(
      urlImagem:
          'https://www.viagenscinematograficas.com.br/wp-content/uploads/2019/03/Cancun-Melhores-Praias-Riviera-Maya-Capa.jpg.webp',
      titulo: 'Pacote Cancún 2025',
      cidade: 'CANCÚN, MEX',
      validade: 'De 01 jan. 25 a 31 dez. 25',
      descricao: 'Aéreo + Hotel All inclusive',
      numDiarias: 5,
      numPessoas: 7,
      valorAntigo: 6818,
      valorAtual: 3749,
    ),
    PacoteTuristico(
      urlImagem:
          'https://xtravel.com.br/wp-content/uploads/2024/02/mercure-resort-allinclusive-maldivas-xtravel.jpg',
      descricao: 'Hotel All Inclusive',
      titulo: 'Pacote Maldivas 2025/2026',
      cidade: 'MALDIVAS',
      validade: 'De 01 jan. 25 a 31 dez. 25',
      numDiarias: 3,
      numPessoas: 5,
      valorAntigo: 10560,
      valorAtual: 6689,
    ),
    PacoteTuristico(
      urlImagem:
          'https://turismo.b-cdn.net/wp-content/uploads/2013/01/Fortaleza-a-capital-do-Ceara.webp',
      titulo: 'Pacote Fortaleza 2025',
      cidade: 'FORTALEZA, BRA',
      validade: 'De 01 jan. 25 a 31 dez. 25',
      descricao: 'Hotel All inclusive',
      numDiarias: 7,
      numPessoas: 3,
      valorAntigo: 2500,
      valorAtual: 1100,
    ),
  ];
}
