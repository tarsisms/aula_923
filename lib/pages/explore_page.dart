import 'package:aula_923/domain/propriedade.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List listaPropriedades = [
    Propriedade(
      urlImage:
          'https://www.envoyage.com/sites/default/files/styles/full_size/public/Dest_Netherlands_Landing.jpg?itok=AXtp56Mm',
      local: 'Harlingen, Netherlands',
      dates: '18 - 23 Dec',
      host: 'Professional Host',
      total: '\$1,068 total',
    ),
    Propriedade(
      urlImage:
          'https://blog.theifriend.com/wp-content/uploads/2021/11/guia-de-viagem-maragogi-al-piscinas-naturais-990x556.png',
      local: 'Maragogi, Brazil',
      host: 'Professional Host',
      dates: '10 Jan - 31 Dec',
      total: '\$5,200 total',
    ),
    Propriedade(
      urlImage:
          'https://www.topensandoemviajar.com/wp-content/uploads/2023/08/melhores-dicas-fazer-fortaleza-ceara.jpg',
      local: 'Fortaleza, Brazil',
      host: 'Professional Host',
      dates: '01-12 Jun',
      total: '\$1,200 total',
    ),
    Propriedade(
      urlImage:
          'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-paris-capa2019-02.jpg',
      local: 'Paris, FRA',
      host: 'Professional Host',
      dates: '01-12 Jun',
      total: '\$1,200 total',
    ),
  ];

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
        itemCount: listaPropriedades.length,
        // Repetir
        itemBuilder: (context, i) {
          return buildContainer(prop: listaPropriedades[i]);
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

  buildContainer({required Propriedade prop}) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(prop.urlImage, height: 300, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8),
              ),
              Positioned(
                child: Icon(Icons.favorite, size: 36, color: Colors.pinkAccent),
                top: 16,
                right: 16,
              ),
            ],
          ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                prop.local,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16), //TextStyle(),
              ),
              Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
            ],
          ),
          buildText(prop.host),
          buildText(prop.dates),
          buildText(prop.total),
        ],
      ),
    );
  }

  buildText(String text) {
    return Text(text, style: GoogleFonts.inter());
  }
}
