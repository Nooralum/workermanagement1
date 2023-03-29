import 'package:flutter/material.dart';
import 'package:workermanagement1/commons/collapse.dart';

class accueil extends StatelessWidget {
  const accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CollapsingNavigationDrawer(),
      body: CollapsingNavigationDrawer(),
    );
  }
}