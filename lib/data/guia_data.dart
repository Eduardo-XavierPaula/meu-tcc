import 'package:cloud_firestore/cloud_firestore.dart';

class GuiaData {
  String client;
  String id;

  String treatment;
  String description;

  Timestamp data;

  GuiaData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    treatment = snapshot.data["treatment"];
    description = snapshot.data["description"];
    data = snapshot.data["data"];
  }

  Map<String, dynamic> toResumeMap(){
    return {
      "treatment":treatment,
      "description":description,
      "data":data
    };
  }
}
