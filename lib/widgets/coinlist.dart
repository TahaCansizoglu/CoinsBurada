import 'package:coinsburada/models/coins.dart';
import 'package:coinsburada/screens/daydetails.dart';
import 'package:flutter/material.dart';
import '../styles/colorandstyles.dart';
import 'counter.dart';

// ignore: must_be_immutable
class CoinList extends StatelessWidget {
  Coins data;

  CoinList({@required this.data});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(width * 0.010),
      margin: EdgeInsets.symmetric(horizontal: 5),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: CircleAvatar(
                  child: Image.network(data.image),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(data.name),
                ),
              ),
              Expanded(
                child: Counter(
                  color: kDeathColor,
                  number: data.currentPrice,
                  title: "Şuanki Değeri",
                ),
              ),
              Expanded(
                child: Counter(
                  color: kRecovercolor,
                  number: data.marketCapRank.toDouble(),
                  title: "Pazar Sıralaması",
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DayDetails(data: data)));
                  },
                  color: Colors.white,
                  textColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  ),
                  padding: EdgeInsets.all(2),
                  shape: CircleBorder(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
