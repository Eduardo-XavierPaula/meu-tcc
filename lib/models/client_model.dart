import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meu_tcc/models/user_model.dart';
import 'package:meu_tcc/data/client_data.dart';
import 'package:scoped_model/scoped_model.dart';

class ClientModel extends Model {
  UserModel user;

  List<ClientData> products = [];

  bool isLoading = false;

  ClientModel(this.user) {
    if (user.isLoggedIn()) _loadClients();
  }

  static ClientModel of(BuildContext context) =>
      ScopedModel.of<ClientModel>(context);

  void addClient(ClientData clientData) {
    products.add(clientData);

    Firestore.instance
        .collection("clients")
        .add(clientData.toMap())
        .then((doc) {
      clientData.cid = doc.documentID;
      clientData.userId=user.firebaseUser.uid;
    });

    notifyListeners();
  }

  void removeClient(ClientData clientData) {
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("clients")
        .document(clientData.cid)
        .delete();

    products.remove(clientData);

    notifyListeners();
  }

  void _loadClients() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("clients")
        .getDocuments();

    products =
        query.documents.map((doc) => ClientData.fromDocument(doc)).toList();

    notifyListeners();
  }
}
