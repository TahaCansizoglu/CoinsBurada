import 'dart:ui';

import 'package:coinsburada/models/coins.dart';
import 'package:coinsburada/styles/colorandstyles.dart';
import 'package:flutter/material.dart';

class BuildStatCard extends StatelessWidget {
  Coins data;
  final Color color;
  final bool onBorder;
  BuildStatCard({
    Key key,
    this.data,
    this.color,
    this.onBorder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 3.1 / 10,
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
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        border: onBorder == true
            ? Border.all(color: Colors.blue[200], width: 0.9)
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.network(
                  data.image,
                ),
                radius: width * 0.065,
                backgroundColor: Colors.transparent,
              ),
              Text(
                " " + data.name,
                style: TextStyle(
                  color: getColor(color),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                " (${data.symbol.toUpperCase()}) ",
                style: TextStyle(
                  color: getColor(color),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          RichText(
              text: TextSpan(
                  text: "Şuanki Değeri: ",
                  style: kBoldText,
                  children: <TextSpan>[
                TextSpan(
                    text: data.currentPrice.toString() + "\$",
                    style: kNormalText)
              ])),
          RichText(
              text: TextSpan(
                  text: "24 Saatlik değişimi: ",
                  style: kBoldText,
                  children: <TextSpan>[
                TextSpan(
                    text: data.priceChange24H.toString() + "\$",
                    style: kNormalText)
              ])),
          RichText(
              text: TextSpan(
                  text: "Pazar Hacmi: ",
                  style: kBoldText,
                  children: <TextSpan>[
                TextSpan(
                    text: data.marketCap.toString() + "\$", style: kNormalText)
              ])),
          RichText(
              text: TextSpan(
                  text: "Pazar Hacmindeki Değişim: ",
                  style: kBoldText,
                  children: <TextSpan>[
                TextSpan(
                    text: data.marketCapChange24H.toString() + "\$",
                    style: kNormalText)
              ])),
        ],
      ),
    );
  }

  Color getColor(Color renk) {
    Color textColor = renk != Colors.white ? Colors.white : Colors.black;

    return textColor;
  }
}
