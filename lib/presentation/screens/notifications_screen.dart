import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../infraestructure/bloc/notifications_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = context.watch<NotificationsBloc>().state.notifications;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Notificaciones', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
      ),
      body: ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index){
        final notification = notifications[index];
        return ListTile(
          title: Text(notification.title),
          subtitle: Text(notification.body),
          leading: notification.imageUrl != null ? Image.network(notification.imageUrl!, width: 25, height: 25) : null,
          onTap: (){
            context.push('/notification-details/${notification.messageId}');
          },
        );
      }),
    );
  }
}