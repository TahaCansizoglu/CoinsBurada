import 'package:coinsburada/models/coins.dart';
import 'package:coinsburada/styles/colorandstyles.dart';

import 'package:coinsburada/widgets/statcard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CoinDetails extends StatelessWidget {
  Coins data;

  CoinDetails({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.network(
                  data.image,
                  height: 50.0,
                  width: 50.0,
                ),
                Text(" " + data.name + "(${data.symbol.toUpperCase()})",
                    style: kDetailStyleHeader)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.bar_chart),
                    Text("Değişim", style: kDetailStyleHeader)
                  ],
                ),
                Text("Şuanki değer: ${data.currentPrice}\$",
                    style: kDetailStyleTitle),
                Text("24 saat içindeki en yüksek değer: ${data.high24H}\$",
                    style: kDetailStyleTitle),
                Text("24 saat içindeki en düşük değer: ${data.low24H}\$",
                    style: kDetailStyleTitle)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.add_shopping_cart),
                    Text(
                      "Pazar",
                      style: kDetailStyleHeader,
                    )
                  ],
                ),
                Text("Pazar Sıralamsı: ${data.marketCapRank}",
                    style: kDetailStyleTitle),
                Text("Pazar Hacmi: ${data.marketCap}",
                    style: kDetailStyleTitle),
                Text("Toplam Hacim: ${data.totalVolume}",
                    style: kDetailStyleTitle)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.swap_vert),
                    Text(
                      "Değişim(24 Saatlik)",
                      style: kDetailStyleHeader,
                    )
                  ],
                ),
                Text(
                  "Değerdeki değişim: %${data.priceChangePercentage24H}",
                  style: kDetailStyleTitle,
                ),
                Text(
                    "Pazar hacmindeki değişim: %${data.marketCapChangePercentage24H}",
                    style: kDetailStyleTitle),
                Text("Ath değişimi: %${data.athChangePercentage}",
                    style: kDetailStyleTitle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.add_shopping_cart),
                    Text(
                      "Tüm Zamanlar(${data.atlDate.year} itibaren)",
                      style: kDetailStyleHeader,
                    )
                  ],
                ),
                Text("Ath: ${data.ath}\$", style: kDetailStyleTitle),
                Text("Ath değişimi: %${data.athChangePercentage}",
                    style: kDetailStyleTitle),
                Text("Atl : ${data.atl}\$", style: kDetailStyleTitle),
                Text("Atl değişimi: %${data.atlChangePercentage}",
                    style: kDetailStyleTitle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
