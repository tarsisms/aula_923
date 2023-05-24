import 'package:flutter/material.dart';

class CardPacoteTuristico extends StatefulWidget {
  final String imagem;
  final int desconto;
  final String titulo;
  final int numDiarias;
  final int numPessoas;
  final int valorAntigo;
  final int valorAtual;
  final String descricao;

  const CardPacoteTuristico({
    Key? key,
    required this.imagem,
    required this.titulo,
    required this.descricao,
    required this.numDiarias,
    required this.numPessoas,
    required this.valorAntigo,
    required this.valorAtual,
    required this.desconto,
  }) : super(key: key);

  @override
  State<CardPacoteTuristico> createState() => _CardPacoteTuristicoState();
}

class _CardPacoteTuristicoState extends State<CardPacoteTuristico> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  widget.imagem,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                color: Colors.deepOrange,
                child: Text(
                  '-${widget.desconto}%',
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
                  widget.titulo,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(widget.descricao, style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text(
                  '${widget.numDiarias} Diárias ${widget.numPessoas} Pessoa',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text('A partir de R\$ ${widget.valorAntigo}'),
                Text(
                  'R\$ ${widget.valorAtual}',
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
    );
  }
}
