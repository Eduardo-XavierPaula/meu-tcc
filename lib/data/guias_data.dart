import 'package:cloud_firestore/cloud_firestore.dart';

class GuiasData {
  String client;
  String id;

  String title;
  String description;

  Timestamp data;

  GuiasData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    data = snapshot.data["data"];
  }

  Map<String, dynamic> toResumeMap(){
    return {
      "title":title,
      "description":description,
      "data":data
    };
  }
}
