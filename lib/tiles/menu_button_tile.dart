import 'package:flutter/material.dart';


class MenuButtonTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;
  // final Route route;

  MenuButtonTile(this.icon, this.text,this.route);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(route);
          },
          child: Container(                                       
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 32.0, color: Colors.grey[700]),
                  Text(text,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16.0,
                      ))
                ],
              ))),
    );
  }
}
