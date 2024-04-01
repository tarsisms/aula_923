import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF10397B), // Colors.lightBlue,
        title: const Text(
          'Pesquisar',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          buildContainerPropaganda(),
          buildCardPacote(),
        ],
      ),
    );
  }

  buildContainerPropaganda() {
    return Container(
      margin: const EdgeInsets.all(16),
      color: Colors.deepPurple,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Tops destinos mais buscados',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Corre que ta rolando muita promoção',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'EU QUERO!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                  )
                ],
              ),
            ),
          ),
          Image.network(
            'https://img.freepik.com/fotos-gratis/casal-multirracial-com-bola-posando-na-praia_23-2148137988.jpg',
            height: 170,
          ),
        ],
      ),
    );
  }

  buildCardPacote() {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              'https://www.viagenscinematograficas.com.br/wp-content/uploads/2019/03/Cancun-Melhores-Praias-Riviera-Maya-Capa.jpg.webp'),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pacote Cancún 2024',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 4),
                Text('Aéreo + Hotel All inclusive'),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.wb_sunny_outlined,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text('5 Diárias'),
                    SizedBox(width: 6),
                    Icon(
                      Icons.person,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text('1 Pessoa'),
                  ],
                ),
                SizedBox(height: 4),
                Text('A partir de R\$ 6.818'),
                Row(
                  children: [
                    Text(
                      'R\$ 3.749',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFFFD6C00),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text('Taxa Grátis em até 12x'),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Cancelamento Grátis!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
