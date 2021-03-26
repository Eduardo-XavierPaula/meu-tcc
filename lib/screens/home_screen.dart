import 'package:flutter/material.dart';
import 'package:meu_tcc/screens/clients_screen.dart';
import 'package:meu_tcc/tabs/clients_tab.dart';
import 'package:meu_tcc/tabs/home_tab.dart';
import 'package:meu_tcc/widget/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics:NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body:HomeTab(_pageController),
          drawer: CustomDrawer(_pageController),
        ), 
                
      ],
    );
  }
}