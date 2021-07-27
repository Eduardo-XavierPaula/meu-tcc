import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormClientScreen extends StatefulWidget {
  @override
  _FormClientScreenState createState() => _FormClientScreenState();
}

class _FormClientScreenState extends State<FormClientScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _telController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text('Novo Cliente')),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromARGB(255, 31, 47, 152),
                Color.fromARGB(255, 28, 167, 236),
                Color.fromARGB(255, 74, 222, 222),
              ],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  tileMode: TileMode.clamp)),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: EdgeInsets.all(16.0), children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(hintText: "Nome"),
            validator: (text) {
              if (text.isEmpty) return "Nome inválido";
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(hintText: "E-mail"),
            keyboardType: TextInputType.emailAddress,
            validator: (text) {
              if (text.isEmpty || !text.contains("@")) return "Email inválido";
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _telController,
            decoration: InputDecoration(hintText: "Telefone"),
            // keyboardType: TextInputType.number,
            validator: (text) {
              if (text.isEmpty) return "Telefone inválido";
            },
          ),
          SizedBox(height: 16.0),
          SizedBox(
              height: 44.0,
              child: RaisedButton(
                child:
                    Text("Cadastrar Cliente", style: TextStyle(fontSize: 18.0)),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Map<String, dynamic> data = {
                      "name": _nameController.text,
                      "email": _emailController.text,
                      "tel": _telController.text
                    };
                    Firestore.instance.collection("clients").add(data);
                    Navigator.pop(context); 
                  }
                },
              )),
        ]),
      ),
    );
  }
}
