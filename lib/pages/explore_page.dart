import 'package:aula_923/db/fake_database.dart';
import 'package:aula_923/widget/container_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.menu),
            hintText: 'Pesquisar',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          ),
        ),
      ),

      // For(i = 0; i < tam; i++)
      body: ListView.builder(
        // Tamanho da lista - Numero de repeticoes
        itemCount: FakeDatabase.listaPropriedades.length,
        // Repetir
        itemBuilder: (context, i) {
          // Chamando o novo Widget
          return ContainerPropriedade(propriedade: FakeDatabase.listaPropriedades[i]);
        },
      ),

      // ListView(
      //   children: [
      //     buildContainer(prop: listaPropriedades[0]),
      //     buildContainer(prop: listaPropriedades[1]),
      //     buildContainer(prop: listaPropriedades[2]),
      //   ],
      // ),
    );
  }
}
