import 'package:flutter/material.dart';

class BusCard extends StatelessWidget {
  const BusCard({
    super.key,
    required this.vehiculo,
    required this.route,
    required this.horaSalida,
    required this.horaLlegada,
    required this.puertaAbordaje,
    required this.status,
    required this.numeroAsiento,
    required this.image,
    required this.onPressed,
  });

  final String vehiculo;
  final String route;
  final String horaSalida;
  final String puertaAbordaje;
  final String horaLlegada;
  final String status;
  final String numeroAsiento;
  final String image;
  final VoidCallback onPressed;

  Color _getColorByStatus(String status) {
    switch (status.toLowerCase()) {
      case 'cancelado':
        return Colors.red;
      case 'abordando':
        return const Color.fromARGB(255, 0, 183, 255);
      case 'vigente':
        return Colors.green;
      default:
        return Colors.black; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    vehiculo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    route,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.timelapse, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    horaSalida,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.arrow_right_alt, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    horaLlegada,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _getColorByStatus(status),
                    ),
                  ),
                  Text(
                          'Puerta \n $puertaAbordaje',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                  ),
                  Column(
                    children: [
                      const Icon(Icons.airline_seat_recline_normal, size: 16),
                      const SizedBox(width: 4),
                      Center(
                        child: Text(
                          'Asiento \n $numeroAsiento',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Image.asset(image, height: 80, width: double.infinity, fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}
