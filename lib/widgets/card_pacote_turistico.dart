import 'package:aula_923/domain/pacote_turistico.dart';
import 'package:aula_923/pages/detail_page.dart';
import 'package:flutter/material.dart';

class CardPacoteTuristico extends StatefulWidget {
  final PacoteTuristico pacoteTuristico;

  const CardPacoteTuristico({
    super.key,
    required this.pacoteTuristico,
  });

  @override
  State<CardPacoteTuristico> createState() => _CardPacoteTuristicoState();
}

class _CardPacoteTuristicoState extends State<CardPacoteTuristico> {
  PacoteTuristico get pacote => widget.pacoteTuristico;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                pacoteTuristico: pacote,
              );
            },
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(pacote.urlImagem),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pacote.titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(pacote.descricao),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny_outlined,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text('${pacote.numDiarias} Diárias'),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.person,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text('${pacote.numPessoas} Pessoas'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('A partir de R\$ ${pacote.valorAntigo}'),
                  Row(
                    children: [
                      Text(
                        'R\$ ${pacote.valorAtual}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xFFFD6C00),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Expanded(child: Text('Taxa Grátis em até 12x')),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Cancelamento Grátis!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
