import 'package:flutter/material.dart';
import 'package:meu_tcc/screens/clients_screen.dart';
import 'package:meu_tcc/tabs/clients_tab.dart';
import 'package:meu_tcc/tabs/home_tab.dart';
// import 'package:meu_tcc/widget/custom_drawer.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return PageView(
      physics:NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body:HomeTab(),          
        ), 
                
      ],
    );
  }
}