import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:meu_tcc/data/guia_data.dart';
import 'package:meu_tcc/tiles/guia_tile.dart';
// import 'package:loja_virtual/datas/product_data.dart';
// import 'package:loja_virtual/tiles/product_tile.dart';
// class ClientInfoScreen extends StatefulWidget {
//   final GuiaData guia;

//   ClientInfoScreen(this.guia);
//   @override
//   _ClientInfoScreenState createState() => _ClientInfoScreenState(guia);
// }

// class _ClientInfoScreenState extends State<ClientInfoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
class ClientInfoScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ClientInfoScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data["name"]),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.list),
                ),
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("clients").document(snapshot.documentID).
            collection("guias").getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              else
                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.all(4.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          childAspectRatio: 0.65
                        ),
                        itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        GuiaData data =GuiaData.fromDocument(snapshot.data.documents[index]);
                        data.client=this.snapshot.documentID;
                        // return Container(child: Text(data.client),);
                        return GuiaTile("grid", data);
                      },
                      ),
                    ListView.builder(
                      padding: EdgeInsets.all(4.0),
                      // itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        // ProductData data =ProductData.fromDocument(snapshot.data.documents[index]);
                        // data.category=this.snapshot.documentID;
                        // return ProductTile("list", data);
                      },
                      )
                  ],
                );
            },
          )),
    );
  }
}
