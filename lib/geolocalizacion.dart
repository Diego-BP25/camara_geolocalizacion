import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Geolocalizacion extends StatefulWidget {
  const Geolocalizacion({Key? key}) : super(key: key);

  @override
  State<Geolocalizacion> createState() => _GeolocalizacionState();
}

class _GeolocalizacionState extends State<Geolocalizacion> {
  String locationInfo =
      ''; // Variable para almacenar la información de la localización

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }
  

  void getCurrentLocation() async {
    Position position = await determinePosition();
    print(position.latitude);
    print(position.longitude);
    // Actualizar la información de la localización
    setState(() {
      locationInfo =
          'Latitud: ${position.latitude}\nLongitud: ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocalizador'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getCurrentLocation();
              },
              child: const Text('Tomar ubicación'),
            ),
            const SizedBox(
                height:
                    20), // Espacio entre el botón y la información de la ubicación
            Text(
              locationInfo, // Mostrar la información de la ubicación aquí
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
