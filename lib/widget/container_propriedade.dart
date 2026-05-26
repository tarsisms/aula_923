import 'package:aula_923/domain/propriedade.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerPropriedade extends StatefulWidget {
  Propriedade propriedade;

  ContainerPropriedade({super.key, required this.propriedade});

  @override
  State<ContainerPropriedade> createState() => _ContainerPropriedadeState();
}

class _ContainerPropriedadeState extends State<ContainerPropriedade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(widget.propriedade.urlImage, height: 300, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8),
              ),
              Positioned(
                child: Icon(Icons.favorite, size: 36, color: Colors.pinkAccent),
                top: 16,
                right: 16,
              ),
            ],
          ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.propriedade.local,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16), //TextStyle(),
              ),
              Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
            ],
          ),
          buildText(widget.propriedade.host),
          buildText(widget.propriedade.dates),
          buildText(widget.propriedade.total),
        ],
      ),
    );
  }

  buildText(String text) {
    return Text(text, style: GoogleFonts.inter());
  }
}
