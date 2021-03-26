import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meu_tcc/tabs/clients_tab.dart';
import 'package:meu_tcc/tiles/client_tile.dart';

class ClientsScreen extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Clientes"),
          centerTitle: true,
          elevation: 0,
          ),
      body:ClientsTab()      
    );
  }
}
