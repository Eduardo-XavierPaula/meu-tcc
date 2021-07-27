import 'package:flutter/material.dart';
import 'package:meu_tcc/models/user_model.dart';
import 'package:meu_tcc/routes/routes.dart';
import 'package:meu_tcc/screens/home_screen.dart';
import 'package:meu_tcc/screens/login_scree.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child:MaterialApp(
      title: "Flutter's Clothing",
      theme: ThemeData(             
        primarySwatch: Colors.blue,    
        primaryColor: Color.fromARGB(255, 4, 125, 141)    
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      onGenerateRoute: RouteGenerator.getRoute,
    )
    );
    
  }
}
