import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/push_messages.dart';
import '../../infraestructure/bloc/notifications_bloc.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatelessWidget {
  final String pushMessageId;

  const DetailsScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message =
        context.watch<NotificationsBloc>().getMessageById(pushMessageId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Detalles de la notificación',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      body: (message != null)
          ? _DetailsView(message: message)
          : const Center(child: Text('Notificación no existe')),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage message;

  const _DetailsView({required this.message});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("dd/MM/yyyy hh:mm").format(message.sentDate);
    List<String> parts = formattedDate.split(' '); // Dividir el string en dos partes: fecha y hora

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.imageUrl != null) Center(child: Image.network(message.imageUrl!, width: 200, height: 200)),
          const SizedBox(height: 20),
          Text(
            'Motivo: ${message.title}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            message.body,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fecha de notificación: ${parts[0]}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Hora de notificación: ${parts[1]}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const Text(
            'Datos adicionales:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            message.data.toString(),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}