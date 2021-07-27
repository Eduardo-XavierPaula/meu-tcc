import 'package:flutter/material.dart';
import 'package:meu_tcc/screens/address_screen.dart';
import 'package:meu_tcc/screens/agenda_screen.dart';
import 'package:meu_tcc/screens/clients_screen.dart';
import 'package:meu_tcc/screens/config_screen.dart';
import 'package:meu_tcc/screens/form_client_screen.dart';
import 'package:meu_tcc/screens/guias_screen.dart';
import 'package:meu_tcc/screens/home_screen.dart';

class RouteGenerator {
  static var routes = <String, WidgetBuilder> {
      '/clients': (BuildContext context) => ClientsScreen(),
      '/agenda': (BuildContext context) => AgendaScreen(),
      '/guias': (BuildContext context) => GuiasScreen(),
      '/configs': (BuildContext context) => ConfigScreen(),
      '/form': (BuildContext context) => FormClientScreen(),
      '/home': (BuildContext context) => HomeScreen(),
      '/address': (BuildContext context) => AdressScreen()
    };
  static Route<dynamic> getRoute(RouteSettings settings) {
      var builder = routes[settings.name];
      if(builder != null) {
          return new MaterialPageRoute(
              settings: settings,
              builder: builder,
          );
      }
      return null;
    }
}

