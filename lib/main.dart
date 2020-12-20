import 'package:coinsburada/screens/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:splashscreen/splashscreen.dart';

import 'models/coins.dart';

void main() async {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  Future<Widget> coins() async {
    var url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
    var response = await http.get(url);
    //debugPrint(response.body);
    var jsonResponse = json.decode(response.body);

    List<Coins> data = [];
    for (var u in jsonResponse) {
      Coins coins = Coins.fromJson(u);
      data.add(coins);
    }
    int range = data.length;
    data.removeRange(100, range);
    data.removeAt(80);

    return Future.value(Anasayfa(
      data: data,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SplashScreen(
      navigateAfterFuture: coins(),
      seconds: 4,
      title: Text(
        'Coin Burada',
        textScaleFactor: 2,
      ),
      image: Image.asset('lib/assets/icon.png'),
      photoSize: 100.0,
    ));
  }
}
