import 'package:cloud_firestore/cloud_firestore.dart';

class GuiaData {
  String client;
  String id;

  String treatment;
  String description;
  String convenio;
  double price;

  bool pago;
  Timestamp data;
  Timestamp vencimento;

  GuiaData();
  GuiaData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    treatment = snapshot.data["treatment"];
    description = snapshot.data["description"];
    data = snapshot.data["data"];
    price = snapshot.data["price"].toDouble();
    vencimento=snapshot.data["vencimento"];
    convenio=snapshot.data["convenio"];
    pago=snapshot.data["pago"];
  }

  Map<String, dynamic> toMap(){
    return {
      "treatment":treatment,
      "description":description,
      "data":data,
      "price":price,
      "vencimento":vencimento,
      "convenio":convenio,
      "pago":pago,
    };
  }
}
