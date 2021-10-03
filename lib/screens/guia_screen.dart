import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:meu_tcc/data/guia_data.dart';
import 'package:meu_tcc/models/guia_model.dart';

class GuiaScreen extends StatefulWidget {
  @override
  _GuiaScreenState createState() => _GuiaScreenState();
}

class _GuiaScreenState extends State<GuiaScreen> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _hourController = TextEditingController();
  final _treatmentController = TextEditingController();
  InputDecoration buildInputDecoration(IconData icons, String hinttext) {
    return InputDecoration(
      hintText: hinttext,
      prefixIcon: Icon(icons),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(color: Colors.green, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Nova Guia"), centerTitle: true),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: _treatmentController,
                  decoration: buildInputDecoration(Icons.medication, 'Tratamento'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: buildInputDecoration(Icons.medical_services, 'Convênio'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  readOnly: true,
                  controller: _dateController,
                  decoration: buildInputDecoration(Icons.calendar_today, 'Data da consulta'),
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2025),
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                        _dateController.text =
                            DateFormat('dd-MM-yyyy').format(selectedDate);
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _hourController,
                  decoration: buildInputDecoration(Icons.alarm, 'Hora da consulta'),
                  onTap: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (BuildContext context, Widget child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child,
                        );
                      },
                    ).then((selectedTime) {
                      if (selectedTime != null) {
                        _hourController.text = selectedTime.format(context);
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: buildInputDecoration(Icons.attach_money_rounded, 'Valor da consulta'),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),                
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descrição do procedimento',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  maxLength: 1000,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(),
                ElevatedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    GuiaData guiaData = GuiaData();
                    guiaData.treatment = _treatmentController.text;
                   
                    // GuiaModel.of(context).addGuia(
                    //   guiaData
                    // );
                    Firestore.instance.collection("clients").add(guiaData.toMap());
                    Navigator.pop(context); 
                  },
                ),
              ],
            )));
  }
}
