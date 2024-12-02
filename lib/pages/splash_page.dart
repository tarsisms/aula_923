import 'package:aula_923/db/shared_prefs.dart';
import 'package:aula_923/pages/home_page.dart';
import 'package:aula_923/pages/login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    bool userStatus = await SharedPrefs().getUser();

    if (userStatus) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF233E7D),
      child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Logo-hurb-branca-bg-azul.jpg/440px-Logo-hurb-branca-bg-azul.jpg'),
    );
  }
}
