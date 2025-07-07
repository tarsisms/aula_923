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
      child: ListView(
        children: [
          CardPropriedade(
            valor: '1,065',
            avaliacao: 4.0,
            datas: '18-23 Dec',
            local: 'Harlingen, Netherlands',
            tipoDeHost: 'Professional Host',
            urlImage:
                'https://news.airbnb.com/wp-content/uploads/sites/4/2019/06/PJM020719Q202_Luxe_WanakaNZ_LivingRoom_0264-LightOn_R1.jpg?fit=3200%2C2133',
          ),
          CardPropriedade(
            valor: '2,225',
            avaliacao: 4.80,
            datas: '10-31 Dec',
            local: 'Harlingen, Netherlands',
            tipoDeHost: 'Professional Host',
            urlImage:
                'https://news.airbnb.com/wp-content/uploads/sites/4/2019/06/PJM020719Q202_Luxe_WanakaNZ_LivingRoom_0264-LightOn_R1.jpg?fit=3200%2C2133',
          ),
        ],
      ),
    );
  }
}
