import 'package:flutter/material.dart';

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
              buildContainerPacoteTuristico(
                nomePacote: 'Pacote Cancún 2023',
              ),
              buildContainerPacoteTuristico(
                nomePacote: 'Pacote Maragogi 2024',
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

  buildContainerPacoteTuristico({String nomePacote = ''}) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              'https://a.cdn-hotels.com/gdcs/production97/d402/6baff29c-e43b-4caf-a9e8-5dcf1279dea0.jpg?impolicy=fcrop&w=800&h=533&q=medium'),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nomePacote,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('Aéreo + Hotel All Inclusive',
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('5 Diárias 1 Pessoa', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('A partir de R\$ 6818'),
                Text(
                  'R\$ 3749',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                SizedBox(height: 8),
                Text('Cancelamento Grátis!',
                    style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
