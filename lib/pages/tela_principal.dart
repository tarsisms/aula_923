import 'package:flutter/material.dart';
import 'package:aula_923/widgets/card_pacote_turistico.dart';
import 'package:aula_923/domain/pacote_turistico.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: buildAppBar(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              buildContainerPropaganda(),
              CardPacoteTuristico(
                pacoteTuristico: PacoteTuristico(
                  imagem:
                      'https://a.cdn-hotels.com/gdcs/production97/d402/6baff29c-e43b-4caf-a9e8-5dcf1279dea0.jpg?impolicy=fcrop&w=800&h=533&q=medium',
                  desconto: 25,
                  descricao: 'Aéreo + Hotel All Inclusive',
                  titulo: 'Pacote Cancún 2023',
                  numDiarias: 2,
                  numPessoas: 5,
                  valorAntigo: 6819,
                  valorAtual: 3749,
                ),
              ),
              CardPacoteTuristico(
                pacoteTuristico: PacoteTuristico(
                  titulo: 'Pacote Maragogi 2023 - 2024',
                  imagem:
                      'https://magazine.zarpo.com.br/wp-content/uploads/2021/07/Capa-Mag_maragogi_piscinas-naturais.jpg',
                  desconto: 30,
                  descricao: 'Hotel All Inclusive',
                  numDiarias: 3,
                  numPessoas: 10,
                  valorAntigo: 5679,
                  valorAtual: 1687,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text('Pesquisar', style: TextStyle(fontSize: 26)),
      centerTitle: false,
      backgroundColor: Color(0xFF10397B),
    );
  }

  buildContainerPropaganda() {
    return Container(
      color: Color(0xFFAD00D5),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Top destinos mais buscados',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Corre que ta rolando muita promoção...',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF8FF04),
                    ),
                    onPressed: () {},
                    child: Text(
                      'EU QUERO!',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/f/fa/Praia_do_Cabo_Branco%2C_Jo%C3%A3o_Pessoa_%28PB%29.jpg',
            height: 200,
          ),
        ],
      ),
    );
  }
}
