import 'package:coinsburada/models/coins.dart';
import 'package:coinsburada/screens/tumbilgiler.dart';
import 'package:coinsburada/widgets/headerwidget.dart';
import 'package:coinsburada/widgets/stats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: Scaffold(body: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<dynamic> bitcoin() async {
    var url = "https://api.coinpaprika.com/v1/coins/btc-bitcoin/markets";
    var response = await http.get(url);
    var jsonResponse = json.decode(response.body);

    dynamic price = jsonResponse[0]["quotes"]["USD"]["price"];

    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      HeaderWidget(),
      SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 6 / 10,
          child: FutureBuilder(
              future: bitcoin(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      StatsGrid(
                        data: snapshot.data,
                      ),
                      Column(
                        children: [
                          RaisedButton(
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TumBilgiler()));
                            },
                            child: Text(
                              "30 Günlük Veriler",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Veriler Yükleniyor\n Lütfen Bekleyiniz\n"),
                      CircularProgressIndicator(),
                    ],
                  ));
                }
              }),
        ),
      ),
    ]);
  }
}
