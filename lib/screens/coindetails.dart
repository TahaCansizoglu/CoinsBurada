import 'package:coinsburada/models/coins.dart';

import 'package:coinsburada/widgets/statcard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DayDetails extends StatelessWidget {
  Coins data;

  DayDetails({@required this.data});
  @override
  Widget build(BuildContext context) {
    String tarihText = "Tarih: ";
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text(tarihText)),
      body: Container(
        color: Colors.red[100],
        child: Column(
          children: [
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: "1",
                  title: 'Günlük Vaka Sayısı',
                  onBorder: true,
                ),
              ],
            )),
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: "1",
                  title: 'Günlük Test Sayısı',
                  onBorder: true,
                ),
                BuildStatCard(
                  color: Colors.white,
                  count: "31",
                  title: 'Günlük Ölüm Sayısı',
                  onBorder: true,
                )
              ],
            )),
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: "31",
                  title: 'Günlük İyileşen Sayısı',
                  onBorder: true,
                ),
                BuildStatCard(
                  color: Colors.white,
                  count: "31",
                  title: 'Toplam Vaka Sayısı',
                  onBorder: true,
                )
              ],
            )),
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: "31",
                  title: 'Toplam Test Sayısı',
                  onBorder: true,
                ),
                BuildStatCard(
                  color: Colors.white,
                  count: "31",
                  title: 'Toplam İyileşen Sayısı',
                  onBorder: true,
                )
              ],
            )),
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: "31",
                  title: 'Toplam Ölüm Sayısı',
                  onBorder: true,
                ),
                BuildStatCard(
                  color: Colors.white,
                  count: "31",
                  title: 'Ağır Hasta Sayısı',
                  onBorder: true,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
