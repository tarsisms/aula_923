import 'package:aula_923/db/shared_prefs.dart';
import 'package:aula_923/pages/explore_page.dart';
import 'package:aula_923/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  var pages = [
    ExplorePage(),
    Center(child: Text('Page 1', style: TextStyle(fontSize: 40))),
    Center(child: Text('Page 2', style: TextStyle(fontSize: 40))),
    Center(child: Text('Page 3', style: TextStyle(fontSize: 40))),
    Center(child: Text('Page 4', style: TextStyle(fontSize: 40))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              SharedPrefs().setUserStatus(false);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ));
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xFFE41D56),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Explorar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.airbnb),
          label: 'Viagens',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.message,
            size: 20,
          ),
          label: 'Mensagens',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.circleUser),
          label: 'Entrar',
        ),
      ],
    );
  }
}
