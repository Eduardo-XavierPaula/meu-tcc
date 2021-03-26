import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meu_tcc/tiles/client_tile.dart';

class ClientsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("clients").orderBy("nome").getDocuments(),
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
        });
  }
}
