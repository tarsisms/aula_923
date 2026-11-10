import 'package:aula_923/domain/propriedade.dart';
import 'package:aula_923/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContainerPropriedade extends StatefulWidget {
  Propriedade propriedade;

  ContainerPropriedade({super.key, required this.propriedade});

  @override
  State<ContainerPropriedade> createState() => _ContainerPropriedadeState();
}

class _ContainerPropriedadeState extends State<ContainerPropriedade> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Obter a Latitude e a Longitude a partir de um Endereco
        // final Geocoding geocoding = Geocoding();
        // List<Location> locations = await geocoding.locationFromAddress(widget.propriedade.local);

        // Obter a Latitute e a Longitude da primeira localizacao
        // var latitude = locations[0].latitude;
        // var longitude = locations[0].longitude;

        // Obter localizacao atual do usuario
        Position myLocationPosition = await getCurrentPosition();

        // Localizacoes
        LatLng myLocation = LatLng(myLocationPosition.latitude, myLocationPosition.longitude);
        LatLng ifalLocation = LatLng(-9.745411162105748, -36.631326404465156);

        // Calcular a distancia entre dois pontos
        double distance = Geolocator.distanceBetween(
          myLocation.latitude,
          myLocation.longitude,
          ifalLocation.latitude,
          ifalLocation.longitude,
        );

        // Converter p/ km
        double distanceInKm = distance / 1000;

        Set<Marker> markes = {
          Marker(
            markerId: MarkerId('1'),
            position: myLocation,
            infoWindow: InfoWindow(title: 'Você está aqui!'),
          ),
          Marker(
            markerId: MarkerId('2'),
            position: ifalLocation,
            infoWindow: InfoWindow(
              title: 'IFAL - campus Arapiraca',
              snippet: 'Distancia de ${distanceInKm.toStringAsFixed(2)} km',
            ),
          ),
        };

        // Navegacao p/ DetailPage passando LatLng
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                propriedade: widget.propriedade,
                markers: markes,
                location: myLocation,
              );
            },
          ),
        );
      },
      child: Container(
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
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ), //TextStyle(),
                ),
                Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
              ],
            ),
            buildText(widget.propriedade.host),
            buildText(widget.propriedade.dates),
            buildText(widget.propriedade.total),
          ],
        ),
      ),
    );
  }

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar se o GPS está ativo
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Verficar se permissao de acessar os dados de Localizacao
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Solicitar a permissao de acesso aos dados de Localizacao
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // Retornar a posicao atual do usuario
    return await Geolocator.getCurrentPosition();
  }

  buildText(String text) {
    return Text(text, style: GoogleFonts.inter());
  }
}
