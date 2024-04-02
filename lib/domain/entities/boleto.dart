class Boletos {
  final List<Boleto> boletos;

  Boletos({required this.boletos});
}

class Boleto {
  final String vehiculo;
  final String route;
  final String horaSalida;
  final String horaLlegada;
  final String status;
  final String numeroAsiento;
  final String puertaAbordaje;

  Boleto({
    required this.vehiculo,
    required this.route,
    required this.horaSalida,
    required this.horaLlegada,
    required this.status,
    required this.numeroAsiento,
    required this.puertaAbordaje,
  });
}