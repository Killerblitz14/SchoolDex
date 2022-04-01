import 'package:flutter/material.dart';
import '../models/news.dart';
import 'popup.dart';

class NewsListe extends StatelessWidget {
  NewsListe(this.neuigkeiten);

  final List<News> neuigkeiten;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (cnx, index) {
          return GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => buildPopupDialog(
                  context,
                  neuigkeiten[index].ueberschrift.toString(),
                  neuigkeiten[index].inhalt.toString(),
                  neuigkeiten[index].datum.toString()),
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                        child: Text(
                          neuigkeiten[index].ueberschrift.toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Text(
                          neuigkeiten[index].datum.toString(),
                          //style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      neuigkeiten[index].inhalt.toString(),
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: neuigkeiten.length,
      ),
    );
  }
}