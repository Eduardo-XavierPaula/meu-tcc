import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_tcc/data/guia_data.dart';
import 'package:meu_tcc/screens/client_info_screen.dart';
import 'package:meu_tcc/screens/guia_screen.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart';

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
                          child: Row(  
                            mainAxisAlignment: MainAxisAlignment.center,                                           
                            children: [  
                              Spacer(),
                        Container(
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
                            Expanded(child: IconButton(
                              icon: Icon(Icons.upload_file_outlined), 
                              onPressed: _createPDF,                             
                              ))
                      ])),
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

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    page.graphics.drawString('Guia do dia - ' + dateFormat.format(guia.data.toDate()),
      PdfStandardFont(PdfFontFamily.helvetica, 30));


    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.helvetica, 30),
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2)
    );
    grid.columns.add(count: 2);
    grid.headers.add(0);

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'Tratamento';
    row.cells[1].value = guia.treatment;

    row = grid.rows.add();
    row.cells[0].value = 'Convênio';
    row.cells[1].value = guia.convenio;

    row = grid.rows.add();
    row.cells[0].value = 'Horaraio de atendimento';
    row.cells[1].value = hourFormat.format(guia.data.toDate()) + " h";

    row = grid.rows.add();
    row.cells[0].value = 'Preço';
    row.cells[1].value = "R\$" + guia.price.toStringAsFixed(2);

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 100,500, 1000));

    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}
