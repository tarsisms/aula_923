import 'package:aula_923/db/propriedades_dao.dart';
import 'package:aula_923/widget/card_propriedade.dart';
import 'package:flutter/material.dart';

import '../domain/propriedade.dart' show Propriedade;

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<List<Propriedade>> futurePropriedades;

  //List<Propriedade> listaPropriedades = [];

  @override
  void initState() {
    super.initState();
    futurePropriedades = PropriedadesDao().listarPropriedades();
    // loadData();
  }

  loadData() async {
    // Esperar o Future concluir
    // listaPropriedades = await PropriedadesDao().listarPropriedades();
    // setState(() {});

    // Aprender a lidar com o Future
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: futurePropriedades,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Propriedade> listaPropriedades = snapshot.requireData;
            return buildListView(listaPropriedades);
          }

          return Center(
              child: CircularProgressIndicator(
            color: Color(0xFFE41D56),
          ));
        },
      ),
    );
  }

  buildListView(listaPropriedades) {
    return ListView.builder(
      // for(int i = 0; i < Database.propriedades.length; i++) {
      //   CardPropriedade(
      //     propriedade: Database.propriedades[i],
      //   )
      // }
      itemCount: listaPropriedades.length,
      itemBuilder: (context, i) {
        return CardPropriedade(
          propriedade: listaPropriedades[i],
        );
      },
    );
  }
}
