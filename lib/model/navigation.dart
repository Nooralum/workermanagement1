import 'package:flutter/material.dart';

class NavigationModel{
  String title;
  IconData icon;

  NavigationModel({required this.title, required this.icon,});

}

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'Dashboard', icon: Icons.insert_chart,),
  NavigationModel(title: 'Accueil', icon: Icons.home,),
  NavigationModel(title: 'Notifications', icon: Icons.notifications,),
  NavigationModel(title: 'Parametre', icon: Icons.settings, ),
  NavigationModel(title: 'Déconnexion', icon: Icons.logout,),
];