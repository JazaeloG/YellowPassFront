// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../infraestructure/bloc/notifications_bloc.dart';
import 'boletos_screen.dart';
import 'notifications_screen.dart';

class MyHomePage extends StatefulWidget {

  
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsBloc>()
              .requestPermission();
  }
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const BotelosScreen(),
    const NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: const Duration(milliseconds: 800),
                tabBackgroundColor: Colors.orangeAccent,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Botelos',
                  ),
                  GButton(
                    icon: Icons.notifications,
                    text: 'Notifications',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}