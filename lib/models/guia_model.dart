import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meu_tcc/data/guia_data.dart';
import 'package:meu_tcc/models/user_model.dart';
// import 'package:meu_tcc/data/client_data.dart';
import 'package:scoped_model/scoped_model.dart';

class GuiaModel extends Model {
  // UserModel user;

  List<GuiaData> products = [];

  bool isLoading = false;
  // GuiaModel(this.user) {
  //   if (user.isLoggedIn()) _loadGuias();
  // }
 

  static GuiaModel of(BuildContext context) =>
      ScopedModel.of<GuiaModel>(context);

  void addGuia(GuiaData guiaData) {
    products.add(guiaData);

    Firestore.instance
        .collection("clients")
        .add(guiaData.toMap());
    notifyListeners();
  }

  // void removeGuia(GuiaData guiaData) {
  //   Firestore.instance
  //       .collection("users")
  //       .document(user.firebaseUser.uid)
  //       .collection("clients")
  //       .document(guiaData.cid)
  //       .delete();

  //   products.remove(guiaData);

  //   notifyListeners();
  // }

  // void _loadGuias() async {
  //   QuerySnapshot query = await Firestore.instance
  //       .collection("users")
  //       .document(user.firebaseUser.uid)
  //       .collection("clients")
  //       .getDocuments();

  //   products =
  //       query.documents.map((doc) => GuiaData.fromDocument(doc)).toList();

  //   notifyListeners();
  // }
}
