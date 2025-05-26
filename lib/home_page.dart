import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // https://a0.muscache.com/im/pictures/5e67688b-757d-44d6-8b4b-1e91dc6fe49f.jpg?im_w=1920

                  ClipRRect(
                    child: Image.network(
                      'https://news.airbnb.com/wp-content/uploads/sites/4/2019/06/PJM020719Q202_Luxe_WanakaNZ_LivingRoom_0264-LightOn_R1.jpg?fit=3200%2C2133',
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),

                  Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          buildText(
                            'Harlingen, Netherlands',
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                          Spacer(),
                          Icon(Icons.star, size: 14),
                          buildText('4.76'),
                        ],
                      ),
                      buildText('Professional Host'),
                      buildText('18-23 Dec'),
                      buildText(
                        '\$1,065 total',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
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
