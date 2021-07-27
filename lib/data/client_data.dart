import 'package:cloud_firestore/cloud_firestore.dart';

class ClientData{
  String category;
  String cid;

  String name;
  String email;

  num tel;

  ClientData.fromDocument(DocumentSnapshot snapshot){
    cid = snapshot.documentID;
    name = snapshot.data["name"];
    email = snapshot.data["email"];
    tel = snapshot.data["tel"] + 0.0;
  }

  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "email":email,
      "tel":tel,
    };


  }
}