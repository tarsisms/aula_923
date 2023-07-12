import 'package:flutter/material.dart';
import 'package:aula_923/pages/detalhes_page.dart';
import 'package:aula_923/domain/pacote_turistico.dart';

class CardPacoteTuristico extends StatefulWidget {
  final PacoteTuristico pacoteTuristico;

  const CardPacoteTuristico({
    Key? key,
    required this.pacoteTuristico,
  }) : super(key: key);

  @override
  State<CardPacoteTuristico> createState() => _CardPacoteTuristicoState();
}

class _CardPacoteTuristicoState extends State<CardPacoteTuristico> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetalhesPage(pacoteTuristico: widget.pacoteTuristico);
            },
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                  child: Image.network(
                    widget.pacoteTuristico.imagem,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  color: Colors.deepOrange,
                  child: Text(
                    '-${widget.pacoteTuristico.desconto}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pacoteTuristico.titulo,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(widget.pacoteTuristico.descricao, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text(
                    '${widget.pacoteTuristico.numDiarias} Diárias ${widget.pacoteTuristico.numPessoas} Pessoa',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text('A partir de R\$ ${widget.pacoteTuristico.valorAntigo}'),
                  Text(
                    'R\$ ${widget.pacoteTuristico.valorAtual}',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  SizedBox(height: 8),
                  Text('Cancelamento Grátis!',
                      style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
