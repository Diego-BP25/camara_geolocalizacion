import 'package:camara_geolocalizacion/camara.dart';
import 'package:camara_geolocalizacion/geolocalizacion.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Inicio')),
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: const [
        Card(
          color: Color.fromARGB(255, 198, 205, 207),
          elevation: 500,
          child: Column(
            
          ),
        ),
      ]),
      drawer: Drawer(
        child: ListView(
          children:  [
            const SizedBox(
              height: 64,
              child: DrawerHeader(
                //encabezado de drawer
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Menu'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camara'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Camara()));
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_pin),
              title: const Text('Geolocalizacion'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Geolocalizacion()));
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}