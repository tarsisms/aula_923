import 'package:aula_923/db/database.dart';
import 'package:aula_923/db/db_helper.dart';
import 'package:aula_923/db/pacote_dao.dart';
import 'package:aula_923/domain/pacote_turistico.dart';
import 'package:aula_923/pages/detail_page.dart';
import 'package:aula_923/widgets/card_pacote_turistico.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PacoteTuristico> pacotes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    pacotes = await PacoteDao().listarPacotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF10397B), // Colors.lightBlue,
        title: const Text(
          'Pesquisar',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          buildContainerPropaganda(),

          // for(int i = 0; i < pacotes.length; i++){
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: pacotes.length,
            itemBuilder: (context, i) {
              return CardPacoteTuristico(
                pacoteTuristico: pacotes[i],
              );
            },
          ),

          // }
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
}
