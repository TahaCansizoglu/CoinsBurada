import 'dart:convert';

import 'package:coinsburada/models/coins.dart';
import 'package:coinsburada/widgets/coinlist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class TumBilgiler extends StatefulWidget {
  List<Coins> data;
  TumBilgiler({@required this.data});

  @override
  _TumBilgilerState createState() => _TumBilgilerState();
}

class _TumBilgilerState extends State<TumBilgiler> {
  @override
  Widget build(BuildContext context) {
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
              height: MediaQuery.of(context).size.height * 8 / 10,
              child: Container(
                child: ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(index);

                    return CoinList(
                      data: widget.data[index],
                      index: index,
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
