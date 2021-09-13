import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:meu_tcc/data/guia_data.dart';
import 'package:meu_tcc/tiles/guia_tile.dart';

// import 'package:loja_virtual/datas/product_data.dart';
// import 'package:loja_virtual/tiles/product_tile.dart';
class ClientInfoScreen extends StatefulWidget {
  final DocumentSnapshot snapshot;

  ClientInfoScreen(this.snapshot);
  @override
  _ClientInfoScreenState createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  int indexTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.snapshot.data["name"]),
            centerTitle: true,
            bottom: TabBar(
              onTap: (index) {
                setState(() {
                  indexTab = index;
                });
              },
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.content_paste),
                ),
                Tab(
                  icon: Icon(Icons.photo_camera),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ),
          floatingActionButton: indexTab == 0
              ? FloatingActionButton(
                  child: const Icon(Icons.note_add),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/guias").then((value) => setState(() {}));
                  },
                )
              : null,
          body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("clients")
                .document(widget.snapshot.documentID)
                .collection("guias")
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              else
                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          child: Text("Guias",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Divider(),
                        Expanded(
                            child: ListView.builder(
                          padding: EdgeInsets.all(4.0),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            GuiaData data = GuiaData.fromDocument(
                                snapshot.data.documents[index]);
                            data.client = this.widget.snapshot.documentID;
                            return GuiaTile(data);
                          },
                        ))
                      ],
                    )),
                    Container(color: Colors.blue),
                    Container(
                      child: Text(this.widget.snapshot.data['name']),
                    )
                  ],
                );
            },
          )),
    );
  }
}










// class ClientInfoScreen extends StatelessWidget {
//   final DocumentSnapshot snapshot;

//   ClientInfoScreen(this.snapshot);
 


//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text(snapshot.data["name"]),
//             centerTitle: true,
//             bottom: TabBar(
//               indicatorColor: Colors.white,
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.note_add),
//                 ),
//                 Tab(
//                   icon: Icon(Icons.photo_camera),
//                 ),
//                 Tab(
//                   icon: Icon(Icons.person),
//                 ),
//               ],
//             ),
//           ),
//           body: FutureBuilder<QuerySnapshot>(
//             future: Firestore.instance
//                 .collection("clients")
//                 .document(snapshot.documentID)
//                 .collection("guias")
//                 .getDocuments(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData)
//                 return Center(child: CircularProgressIndicator());
//               else
//                 return TabBarView(
//                   controller: _tabController,                  
//                   physics: NeverScrollableScrollPhysics(),
//                   children: [
//                     Container(
//                         child: Column(children: [
//                           Text(_tabController.toString()),
//                       Expanded(
//                           child: ListView.builder(
//                         padding: EdgeInsets.all(4.0),
//                         itemCount: snapshot.data.documents.length,
//                         itemBuilder: (context, index) {
//                           GuiaData data = GuiaData.fromDocument(
//                               snapshot.data.documents[index]);
//                           data.client = this.snapshot.documentID;
//                           return GuiaTile(data);
//                         },
//                       )),
//                       FloatingActionButton(                        
//                         onPressed: () {},
//                         child: const Icon(Icons.person_add_alt_1_rounded),
//                         backgroundColor: Theme.of(context).primaryColor,
//                       )
//                     ])),
//                     Container(color: Colors.blue),
//                     Container(
//                       child: Text(this.snapshot.data['name']),
//                     )                  
//                   ],
//                 );
//             },
//           )),
//     );
//   }
// }
