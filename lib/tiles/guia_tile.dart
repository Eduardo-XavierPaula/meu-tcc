import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_tcc/data/guia_data.dart';
import 'package:meu_tcc/screens/client_info_screen.dart';
import 'package:meu_tcc/screens/guia_screen.dart';

class GuiaTile extends StatelessWidget {
  final GuiaData guia;

  GuiaTile(this.guia);
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat hourFormat = DateFormat("HH:mm");
  DateFormat vencFormat = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context)=>ClientInfoScreen(guia))
          // );
        },
        child: Card(
            child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                            padding: EdgeInsets.all(2),
                            constraints: BoxConstraints(minWidth: 100),
                            decoration: BoxDecoration(
                                color: (guia.pago)
                                    ? Colors.green
                                    : (guia.vencimento
                                            .toDate()
                                            .isBefore(DateTime.now()))
                                        ? Colors.red
                                        : Colors.orange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: (guia.pago)
                                ? Text(
                                    "Pago",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                : (guia.vencimento
                                        .toDate()
                                        .isBefore(DateTime.now()))
                                    ? Text(
                                        "Vencido",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    : Text(
                                        "Quitar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Tratamento: " + guia.treatment,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Data: " + dateFormat.format(guia.data.toDate()),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            hourFormat.format(guia.data.toDate()) + " h",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Convênio: " + guia.convenio,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Preço: R\$" + guia.price.toStringAsFixed(2),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            "Venc.: " +
                                dateFormat.format(guia.vencimento.toDate()),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        )));
  }
}
