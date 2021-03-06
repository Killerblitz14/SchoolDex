import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NeueNews extends StatefulWidget {
  final Function addNx;
  final String schulname;
  final String userId;

  NeueNews(this.addNx, this.schulname, this.userId);

  @override
  State<NeueNews> createState() => _NeueNewsState();
}

class _NeueNewsState extends State<NeueNews> {
  final ueberschriftenController = TextEditingController();
  final inhaltController = TextEditingController();

  final _newsFocusNode = FocusNode();

  void submitData() {
    final enteredUeberschrift = ueberschriftenController.text;
    final enteredInhalt = inhaltController.text;
    String datum = DateFormat('dd.MM.yyyy').format(DateTime.now());

    if (enteredUeberschrift.isEmpty || enteredInhalt.isEmpty) {
      return;
    }

    // ServicesNews.addNews(
    //     ueberschriftenController.text, inhaltController.text, datum);

    widget.addNx(
      ueberschriftenController.text,
      inhaltController.text,
      datum,
      widget.schulname,
      widget.userId,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          //margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
            child: const Text(
              'News hinzufügen',
              style: TextStyle(fontSize: 28),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: TextField(
                decoration: const InputDecoration(labelText: 'Überschrift'),
                controller: ueberschriftenController,
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_newsFocusNode);
                }),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Inhalt'),
              controller: inhaltController,
              focusNode: _newsFocusNode,
              onSubmitted: (_) => submitData(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Text(
                  'Hinzufügen',
                  style: TextStyle(
                    color: Color.fromARGB(255, 29, 44, 89),
                  ),
                ),
                onPressed: submitData,
              ),
              IconButton(
                onPressed: (() => Navigator.of(context).pop()),
                icon: const Icon(Icons.close),
                color: const Color.fromARGB(255, 29, 44, 89),
              )
            ],
          ),
        ],
      ),
    );
  }
}
