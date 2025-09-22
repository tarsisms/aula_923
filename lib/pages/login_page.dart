import 'package:aula_923/db/shared_prefs.dart';
import 'package:aula_923/db/user_dao.dart';
import 'package:aula_923/pages/home_page.dart';
import 'package:aula_923/pages/register_page.dart' show RegisterPage;
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Entre no Airbnb',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  focusedBorder: buildPasswordOutlineInputBorder(),
                  border: buildPasswordOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE41D56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: onPressedRegisterPage,
                child: Text(
                  'Cadastrar Usuário',
                  style: TextStyle(
                    color: Color(0xFFE41D56),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    String user = userController.text;
    String password = passwordController.text;

    bool auth = await UserDao().autenticacao(user, password);

    if (auth) {
      SharedPrefs().setUserStatus(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      print('Usuario e/ou senha incorretos!');
    }
  }

  Future<void> onPressedRegisterPage() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RegisterPage();
        },
      ),
    );
  }

  OutlineInputBorder buildPasswordOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(8),
      ),
    );
  }

  OutlineInputBorder buildUserOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8),
      ),
    );
  }
}
