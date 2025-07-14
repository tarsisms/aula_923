import 'package:aula_923/domain/propriedade.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPropriedade extends StatefulWidget {
  Propriedade propriedade;

  CardPropriedade({super.key, required this.propriedade});

  @override
  State<CardPropriedade> createState() => _CardPropriedadeState();
}

class _CardPropriedadeState extends State<CardPropriedade> {
  // String getUrlImage() {
  //   return widget.urlImage;
  // }

  Propriedade get propriedade => widget.propriedade;

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
            child: Image.network(propriedade.urlImage),
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  buildText(
                    widget.propriedade.local,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                  Spacer(),
                  Icon(Icons.star, size: 14),
                  buildText('${widget.propriedade.avaliacao}'),
                ],
              ),
              buildText(widget.propriedade.tipoDeHost),
              buildText(widget.propriedade.datas),
              buildText(
                '\$${widget.propriedade.valor} total',
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
