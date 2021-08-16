import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meu_tcc/models/user_model.dart';

class ClientData{
  String userId;
  String cid;
  String name;
  String email;
  num tel;
 
  
  ClientData();
  ClientData.fromDocument(DocumentSnapshot snapshot){
    cid = snapshot.documentID;
    userId = snapshot.data["userId"];
    name = snapshot.data["name"];
    email = snapshot.data["email"];
    tel = snapshot.data["tel"] + 0.0;
  }

  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "email":email,
      "tel":tel,
      "userId":userId
    };


  }
}