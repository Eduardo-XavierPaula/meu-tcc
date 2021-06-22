import 'package:cloud_firestore/cloud_firestore.dart';

class ClientData{
  String category;
  String id;

  String name;
  String email;

  num tel;

  ClientData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    name = snapshot.data["name"];
    email = snapshot.data["email"];
    tel = snapshot.data["tel"] + 0.0;
  }

  Map<String,dynamic> toResumeMap(){
    return{
      "name":name,
      "email":email,
      "tel":tel,
    };
  }
}