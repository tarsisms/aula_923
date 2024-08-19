import 'package:aula_923/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
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
              TextField(
                cursorColor: const Color(0xFF10397B),
                decoration: buildInputDecoration(
                  'E-mail',
                  Icons.mail_outline_outlined,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
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
