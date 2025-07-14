import 'package:aula_923/db/database.dart';
import 'package:aula_923/widget/card_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        // for(int i = 0; i < Database.propriedades.length; i++) {
        //   CardPropriedade(
        //     propriedade: Database.propriedades[i],
        //   )
        // }
        itemCount: Database.propriedades.length,
        itemBuilder: (context, i) {
          return CardPropriedade(
            propriedade: Database.propriedades[i],
          );
        },
      ),
    );
  }
}
