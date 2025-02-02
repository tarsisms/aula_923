import 'package:aula_923/api/address_api.dart';
import 'package:aula_923/db/user_dao.dart';
import 'package:aula_923/domain/address.dart';
import 'package:aula_923/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmSenhaController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
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
                    if (value!.contains("@")) {
                      return null;
                    } else {
                      return "Você precisa digitar um e-mail válido!";
                    }
                  },
                  decoration: buildInputDecoration('E-mail'),
                  cursorColor: const Color(0xFF10397B),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  controller: senhaController,
                  validator: (value) {
                    if (value!.length >= 6) {
                      return null;
                    } else {
                      return "Você precisa digitar uma senha válida!";
                    }
                  },
                  decoration: buildInputDecoration('Senha'),
                  cursorColor: const Color(0xFF10397B),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  controller: confirmSenhaController,
                  validator: (value) {
                    String senha = senhaController.text;
                    if (value!.length < 6) {
                      return "Você precisa digitar uma senha válida!";
                    } else if (value != senha) {
                      return "As senhas precisam ser iguais!";
                    } else {
                      return null;
                    }
                  },
                  decoration: buildInputDecoration('Confirmação de Senha'),
                  cursorColor: const Color(0xFF10397B),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: cepController,
                  decoration: buildInputDecoration(
                    'CEP',
                    suffixIcon: IconButton(
                      onPressed: onPressedCepButton,
                      icon: const Icon(Icons.search),
                    ),
                  ),
                  cursorColor: const Color(0xFF10397B),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: enderecoController,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Você precisa digitar um endereço válido!";
                    }
                  },
                  decoration: buildInputDecoration('Endereço'),
                  cursorColor: const Color(0xFF10397B),
                ),
                const SizedBox(height: 32),
                // Spacer(),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE81F7C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Cadastrar',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
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

  Future<void> onPressedCepButton() async {
    String cep = cepController.text;
    try {
      Address address = await AddressApi().findAddressByCep(cep);
      enderecoController.text = address.street;
    } catch (e) {
      showSnackBar('Ocorreu um erro inesperado!');
    }
  }

  showSnackBar(String snackBarMessage) {
    SnackBar snackBar = SnackBar(
      content: Text(snackBarMessage),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  buildInputDecoration(String name, {Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFF10397B),
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFF10397B),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    // Validar o Form
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String senha = senhaController.text;

      User user = User(email, senha);
      UserDao().saveUser(user);
      Navigator.pop(context);
    }
  }
}
