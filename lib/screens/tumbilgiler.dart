import 'dart:convert';

import 'package:coinsburada/models/coins.dart';
import 'package:coinsburada/widgets/coinlist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TumBilgiler extends StatelessWidget {
  TumBilgiler();

  @override
  Widget build(BuildContext context) {
    Future<List<Coins>> coins() async {
      var url =
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
      var response = await http.get(url);
      //debugPrint(response.body);
      var jsonResponse = json.decode(response.body);

      List<Coins> datas = [];
      for (var u in jsonResponse) {
        Coins coins = Coins.fromJson(u);
        datas.add(coins);
      }
      int range = datas.length;
      datas.removeRange(100, range);

      return datas;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Currency",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Pazar Hacmi /24h",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Değer/24h",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 8.3 / 10,
            child: FutureBuilder(
                future: coins(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CoinList(
                            data: snapshot.data[index],
                            index: index,
                          );
                        },
                      ),
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
        ],
      ),
    );
  }
}
