import 'package:aula_923/db/pacote_dao.dart';
import 'package:aula_923/db/shared_prefs.dart';
import 'package:aula_923/domain/pacote_turistico.dart';
import 'package:aula_923/pages/login.dart';
import 'package:aula_923/pages/register_package.dart';
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      body: ListView(
        children: [
          buildContainerPropaganda(),

          // for(int i = 0; i < pacotes.length; i++){
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    child: const Text(
                      'EU QUERO!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
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

  buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color(0xFF10397B),
      actions: [
        IconButton(
          onPressed: () {
            SharedPrefs().setUser(false);
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ));
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        )
      ],
      title: const Text(
        'Pesquisar',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF3F68F7),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const RegisterPackage();
            },
          ),
        ).then(
          (value) async {
            await loadData();
            setState(() {});
          },
        );
      },
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
