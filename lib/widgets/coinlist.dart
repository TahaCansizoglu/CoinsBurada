import 'package:coinsburada/models/coins.dart';
import 'package:coinsburada/screens/coindetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoinList extends StatelessWidget {
  Coins data;
  int index;
  CoinList({@required this.data, this.index});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        child: Container(
            padding: EdgeInsets.all(width * 0.010),
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              border: Border.all(color: Colors.blue[200], width: 0.9),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      " " + (index + 1).toString() + " ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(data.image),
                      maxRadius: 18,
                      minRadius: 18,
                    ),
                    Text(
                      data.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.marketCap.toString() + "\$"),
                    Text(data.marketCapChange24H.toStringAsFixed(2) + "\$",
                        style:
                            TextStyle(color: getcolor(data.marketCapChange24H)))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.currentPrice.toStringAsFixed(2) + "\$",
                    ),
                    Text(
                      data.priceChangePercentage24H.toString() + "%",
                      style: TextStyle(
                          color: getcolor(data.priceChangePercentage24H)),
                    )
                  ],
                ),
              ],
            )),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CoinDetails(data: data)),
            ));
  }

  Color getcolor(double deger) {
    if (deger < 0)
      return Colors.red;
    else if (deger == 0)
      return Colors.black;
    else
      return Colors.green;
  }
}
