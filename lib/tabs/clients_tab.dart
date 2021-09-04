import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meu_tcc/models/user_model.dart';
import 'package:meu_tcc/tiles/client_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class ClientsTab extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
        return  FutureBuilder<QuerySnapshot>(
        future: 
        Firestore.instance
          .collection("clients")                       
          .where("userId", isEqualTo:model.firebaseUser.uid) 
          .orderBy("name",descending: false)                                        
          .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {            
            var dividedTiles = ListTile.divideTiles(
                    tiles: snapshot.data.documents.map((doc) {
                      return ClientTile(doc);
                    }).toList(),
                    color: Colors.grey[500])
                .toList();

            return ListView(
              children: dividedTiles,
            );
          }
        });});
  }
}
