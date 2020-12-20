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
                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Değişim", style: kDetailStyleHeader))
                  ],
                ),
                Text("Şuanki değer: ${data.currentPrice}\$",
                    style: kDetailStyleTitle),
                RichText(
                    text: TextSpan(
                        text: "24 saat içindeki en yüksek değer: ",
                        style: kDetailStyleTitle,
                        children: <TextSpan>[
                      TextSpan(
                          text: data.high24H.toString() + "\$",
                          style: kDetailStyleTitleGreen)
                    ])),
                RichText(
                    text: TextSpan(
                        text: "24 saat içindeki en düşük değer: ",
                        style: kDetailStyleTitle,
                        children: <TextSpan>[
                      TextSpan(
                          text: data.low24H.toString() + "\$",
                          style: kDetailStyleTitleRed)
                    ])),
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
                RichText(
                    text: TextSpan(
                        text: "Değerdeki değişim: ",
                        style: kDetailStyleTitle,
                        children: <TextSpan>[
                      TextSpan(
                          text: "%" + data.priceChangePercentage24H.toString(),
                          style: getcolor(data.priceChangePercentage24H))
                    ])),
                RichText(
                    text: TextSpan(
                        text: "Pazar hacmindeki değişim: ",
                        style: kDetailStyleTitle,
                        children: <TextSpan>[
                      TextSpan(
                          text: "%" +
                              data.marketCapChangePercentage24H.toString(),
                          style: getcolor(data.marketCapChangePercentage24H))
                    ])),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.add_shopping_cart),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Tüm Zamanlar(${data.atlDate.year})",
                        style: kDetailStyleHeader,
                      ),
                    )
                  ],
                ),
                RichText(
                    text: TextSpan(
                        text: "Ath: ",
                        style: kDetailStyleTitle,
                        children: <TextSpan>[
                      TextSpan(
                          text: data.ath.toString() + "\$",
                          style: kDetailStyleTitle)
                    ])),
                RichText(
                    text: TextSpan(
                        text: "Ath değişimi: ",
                        style: kDetailStyleTitle,
                        children: <TextSpan>[
                      TextSpan(
                          text: "%" + data.athChangePercentage.toString(),
                          style: getcolor(data.athChangePercentage))
                    ])),
                RichText(
                    text: TextSpan(
                        text: "Atl: ",
                        style: kDetailStyleTitle,
                        children: <TextSpan>[
                      TextSpan(
                          text: data.atl.toString() + "\$",
                          style: kDetailStyleTitle)
                    ])),
                RichText(
                    text: TextSpan(
                        text: "Atl değişimi: ",
                        style: kDetailStyleTitle,
                        children: <TextSpan>[
                      TextSpan(
                          text: "%" + data.atlChangePercentage.toString(),
                          style: getcolor(data.atlChangePercentage))
                    ])),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextStyle getcolor(double deger) {
    if (deger < 0)
      return kDetailStyleTitleRed;
    else if (deger == 0)
      return kDetailStyleTitle;
    else
      return kDetailStyleTitleGreen;
  }
}
