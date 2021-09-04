import 'package:flutter/material.dart';
import 'package:meu_tcc/data/guia_data.dart';
import 'package:meu_tcc/screens/client_info_screen.dart';
import 'package:meu_tcc/screens/guia_screen.dart';

class GuiaTile extends StatelessWidget {
  final String type;
  final GuiaData guia;

  GuiaTile(this.type, this.guia);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context)=>ClientInfoScreen(guia))
        // );
      },
        child: Card(
      child: type == "grid"
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // AspectRatio(
                //   aspectRatio: 0.8,
                //   child: Image.network(
                //     guia.images[0],
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(
                        guia.treatment!=null?guia.treatment:'Não pode ser encontrado',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      // Text("R\$ ${guia.price.toStringAsFixed(2)}",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 17.0,
                      //       color: Theme.of(context).primaryColor,
                      //     )),
                    ]),
                  ),
                )
              ],
            )
          : Row(
              children: [
                // Flexible(
                //   flex: 1,
                //   child: Image.network(
                //     guia.images[0],
                //     fit: BoxFit.cover,
                //     height: 200.0,
                //   )
                // ),
                // Flexible(
                //   flex: 1,
                //   child: Container(
                //     padding: EdgeInsets.all(8.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //       Text(
                //         guia.title,
                //         style: TextStyle(fontWeight: FontWeight.w500),
                //       ),
                //       Text("R\$ ${guia.price.toStringAsFixed(2)}",
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 17.0,
                //             color: Theme.of(context).primaryColor,
                //           )),
                //     ]),
                //   ),
                // ),
              ],
            ),
    ));
  }
}
