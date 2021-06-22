import 'package:flutter/material.dart';
import 'package:meu_tcc/screens/agenda_screen.dart';
import 'package:meu_tcc/screens/clients_screen.dart';
import 'package:meu_tcc/screens/form_client_screen.dart';

class RouteGenerator {
  static var routes = <String, WidgetBuilder> {
      '/clients': (BuildContext context) => ClientsScreen(),
      '/agenda': (BuildContext context) => AgendaScreen(),
      '/guias': (BuildContext context) => AgendaScreen(),
      '/configs': (BuildContext context) => AgendaScreen(),
      '/form': (BuildContext context) => FormClientScreen(),
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

