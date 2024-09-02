import 'package:aula_923/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controlador
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  // Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Entrar no Hurb',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF10397B),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Image.network(
                  'https://img.freepik.com/vetores-gratis/integracao-de-ilustracao-do-conceito-abstrato-de-migrantes-migrantes-aceitos-pela-sociedade_335657-619.jpg?t=st=1721609838~exp=1721613438~hmac=61ff298754aa1b950f370cc08a4ea8940e6827830844f42020f9e9ce60024ad4&w=826',
                  height: 180,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo e-mail obrigatório.';
                    } else if (value!.contains('@')) {
                      return null;
                    } else {
                      return 'Você precisa de um e-mail válido.';
                    }
                  },
                  cursorColor: const Color(0xFF10397B),
                  decoration: buildInputDecoration(
                    'E-mail',
                    Icons.mail_outline_outlined,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: senhaController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.length >= 6) {
                      return null;
                    } else {
                      return 'Você precisa de uma senha válida.';
                    }
                  },
                  cursorColor: const Color(0xFF10397B),
                  decoration: buildInputDecoration(
                    'Senha',
                    Icons.lock_outline,
                  ),
                ),
                const SizedBox(height: 32),
                // Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Validar os campos de e-mail e senha
                    if (formKey.currentState!.validate()) {
                      // Recuperar os dados dos TextFormFields
                      String email = emailController.text;
                      String senha = senhaController.text;

                      if (email == 'joao@gmail.com' && senha == '123456') {
                        // Navegar p/ HomePage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      } else {
                        print('E-mail e/ou Senha incorreto(s)');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE81F7C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                  ),
                  child: const Text(
                    'Entrar com a conta Hurb',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildInputDecoration(String label, IconData iconData) {
    return InputDecoration(
      prefixIcon: Icon(iconData),
      labelText: label,
      floatingLabelStyle: const TextStyle(
        color: Color(0xFF10397B),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFF10397B),
          width: 2,
        ),
      ),
    );
  }
}
