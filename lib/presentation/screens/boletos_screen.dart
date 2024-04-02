import 'package:flutter/material.dart';
import '../widgets/bus_card.dart';

class BotelosScreen extends StatefulWidget {
  const BotelosScreen({Key? key}) : super(key: key);

  @override
  State<BotelosScreen> createState() => _BotelosScreenState();
}

class _BotelosScreenState extends State<BotelosScreen> {
  List<Map<String, String>> boletos = [
    {
      'vehiculo': 'AUT101',
      'ruta': 'CDMX - Veracruz',
      'horaSalida': '08:00 AM',
      'horaLlegada': '10:00 AM',
      'status': 'Vigente',
      'numeroAsiento': 'A1',
      'puertaAbordaje': 'A1'
    },
    {
      'vehiculo': 'AUT114',
      'ruta': 'CDMX - Puebla',
      'horaSalida': '10:30 AM',
      'horaLlegada': '12:30 PM',
      'status': 'Abordando',
      'numeroAsiento': 'B3',
      'puertaAbordaje': 'B1'
    },
    {
      'vehiculo': 'AUT102',
      'ruta': 'Guadalajara - Monterrey',
      'horaSalida': '01:00 PM',
      'horaLlegada': '04:00 PM',
      'status': 'Cancelado',
      'numeroAsiento': 'C5',
      'puertaAbordaje': 'A1'
    },
    {
      'vehiculo': 'AUT103',
      'ruta': 'Orizaba - Puebla',
      'horaSalida': '01:00 PM',
      'horaLlegada': '04:00 PM',
      'status': 'Finalizado',
      'numeroAsiento': 'C5',
      'puertaAbordaje': 'A1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Mis boletos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: boletos.length,
          itemBuilder: (BuildContext context, int index) {
            final boleto = boletos[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: BusCard(
                vehiculo: boleto['vehiculo']!,
                route: boleto['ruta']!,
                horaSalida: boleto['horaSalida']!,
                horaLlegada: boleto['horaLlegada']!,
                status: boleto['status']!,
                numeroAsiento: boleto['numeroAsiento']!,
                image: 'assets/images/bus_card_image.png',
                puertaAbordaje: boleto['numeroAsiento']!,
                onPressed: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}