import 'package:aula_923/domain/pacote_turistico.dart';
import 'package:flutter/material.dart';


class DetalhesPage extends StatefulWidget {
  final PacoteTuristico pacoteTuristico;

  const DetalhesPage({Key? key, required this.pacoteTuristico})
      : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.pacoteTuristico.imagem),
            Text(
              widget.pacoteTuristico.titulo,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
