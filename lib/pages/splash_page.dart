import 'package:aula_923/db/shared_prefs.dart';
import 'package:aula_923/pages/home_page.dart';
import 'package:aula_923/pages/login_page.dart';
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
    checkUserLogin();
  }

  checkUserLogin() async {
    bool status = await SharedPrefs().getUserStatus();
    await Future.delayed(Duration(seconds: 3));
    if (status) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE395C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.network(
              'https://a0.muscache.com/pictures/09104ce1-4a66-4284-80b2-ad0ea3e46c24.jpg'),
          Spacer(),
          CircularProgressIndicator(backgroundColor: Colors.white),
          SizedBox(height: 64),
        ],
      ),
    );
  }
}
