import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPropriedade extends StatefulWidget {
  String urlImage;
  String local;
  String tipoDeHost;
  String datas;
  String valor;
  double avaliacao;

  CardPropriedade({
    super.key,
    required this.urlImage,
    required this.local,
    required this.avaliacao,
    required this.tipoDeHost,
    required this.datas,
    required this.valor,
  });

  @override
  State<CardPropriedade> createState() => _CardPropriedadeState();
}

class _CardPropriedadeState extends State<CardPropriedade> {
  // String getUrlImage() {
  //   return widget.urlImage;
  // }
  String get urlImage => widget.urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            child: Image.network(urlImage),
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  buildText(
                    widget.local,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                  Spacer(),
                  Icon(Icons.star, size: 14),
                  buildText('${widget.avaliacao}'),
                ],
              ),
              buildText(widget.tipoDeHost),
              buildText(widget.datas),
              buildText(
                '\$${widget.valor} total',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
              ),
            ],
          )
        ],
      ),
    );
  }

  buildText(String text, {fontSize, fontWeight, decoration}) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
