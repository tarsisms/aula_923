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
        backgroundColor: Color(0xFF10397B), // Colors.lightBlue,
        title: Text(
          'Pesquisar',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(16) ,
              color: Colors.deepPurple,
              child: Row(
                children: [
                  Expanded(child:
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Tops destinos mais buscados',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Corre que ta rolando muita promoção',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
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
                    )
                  ),
                  Image.network(
                    'https://img.freepik.com/fotos-gratis/casal-multirracial-com-bola-posando-na-praia_23-2148137988.jpg',
                    height: 170,
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
