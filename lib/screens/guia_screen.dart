import 'package:flutter/material.dart';

class GuiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Nova Guia"), centerTitle: true),
        body: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Tratamento'),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Convênio'),
                ),
                TextField(),
                TextField(),
                TextField()
              ],
            )));
  }
}
