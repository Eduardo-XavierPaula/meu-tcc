import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meu_tcc/models/client_model.dart';
import 'package:meu_tcc/tabs/clients_tab.dart';
import 'package:meu_tcc/tiles/client_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class ClientsScreen extends StatefulWidget {
  @override
  _ClientsScreenState createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Clientes"),
          centerTitle: true,
          elevation: 0,
          ),
      body:ScopedModelDescendant<ClientModel>(builder: (context, child, model){
          return ClientsTab();
      },),
      
      
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed("/form").then((value) => setState(() {}));
      },
      child: const Icon(Icons.person_add_alt_1_rounded),
      backgroundColor: Theme.of(context).primaryColor,
    ),      
    );
  }

}


