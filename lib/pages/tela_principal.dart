import 'package:flutter/material.dart';
import 'package:aula_923/widgets/card_pacote_turistico.dart';
import 'package:aula_923/domain/pacote_turistico.dart';
import 'package:flutter/cupertino.dart';
import 'package:aula_923/pages/destaques_page.dart';


class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int selectedIndex = 0;

  var pages = [
    DestaquesPage(),
    Center(child: Text('Page 1', style: TextStyle(fontSize: 24))),
    Center(child: Text('Page 2', style: TextStyle(fontSize: 24))),
    Center(child: Text('Page 3', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: buildAppBar(),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Color(0xFFE81F7C),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.compass),
              label: 'Destaques'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.luggage),
              label: 'Pacotes'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'Mais'
            ),
          ],
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

}
