import 'package:coinsburada/models/coins.dart';
import 'package:flutter/material.dart';
import 'statcard.dart';

class StatsGrid extends StatelessWidget {
  dynamic data;
  StatsGrid({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: <Widget>[
          Flexible(
              child: Row(
            children: [
              BuildStatCard(
                title: 'Bitcoin',
                count: "",
                color: Colors.blue,
              ),
            ],
          )),
          Flexible(
            child: Row(
              children: <Widget>[
                BuildStatCard(
                    title: 'Değeri',
                    count: data.toString(),
                    color: Colors.grey),
                BuildStatCard(
                    title: 'Hasta',
                    color: Colors.orange,
                    count: data.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
