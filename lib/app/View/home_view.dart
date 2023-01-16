import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/View/analytics_view.dart';
import 'package:homlisellerapp/app/View/profile_view.dart';
import 'package:homlisellerapp/app/View/menu_view.dart';
import 'package:homlisellerapp/app/shared/color.dart';

import 'khana_views/khana_food_one_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _pag = [
    {'pag': const MenuView()},
    {'pag': const ProfileView()},
    {'pag': const KhanaFoodOneView()},
    {'pag': const AnalyticsView()},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pag[_selectedIndex]['pag'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        iconSize: 30,
        backgroundColor: FixedColors.purple,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(color: Colors.grey),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: ''),
        ],
      ),
    );
  }
}
