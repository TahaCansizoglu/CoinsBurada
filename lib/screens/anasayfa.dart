import 'dart:convert';
import 'package:coinsburada/screens/tumbilgiler.dart';
import 'package:coinsburada/widgets/statcard.dart';
import 'package:http/http.dart' as http;
import 'package:coinsburada/models/coins.dart';
import 'package:coinsburada/widgets/headerwidget.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  List<Coins> data;
  Anasayfa({Key key, this.data}) : super(key: key);
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderWidget(),
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 6.6 / 10,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.7 / 10,
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Text(
                      "Piyasa Değeri En Fazla Olan Kripto Para",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  BuildStatCard(
                    data: widget.data[0],
                    color: Colors.white,
                  ),
                  RaisedButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TumBilgiler(
                                    data: widget.data,
                                  )));
                    },
                    child: Text(
                      "Kripto Para Listesi",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
