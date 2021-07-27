import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meu_tcc/screens/client_info_screen.dart';
// import 'package:loja_virtual/screens/category_screen.dart';

class ClientTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  ClientTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius:25.0,
        backgroundColor: Colors.transparent,
        child: Icon(
                    Icons.person, size: 32.0,   
                    color: Colors.black,                  
                    ),),
      
      title: Text(snapshot.data["name"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>ClientInfoScreen(snapshot))
        );
      },
    );
  }
}