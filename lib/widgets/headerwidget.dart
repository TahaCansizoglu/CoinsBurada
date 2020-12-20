import 'package:coinsburada/screens/testscreen.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 3.4 / 10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50 / 10,
          ),
          Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 6 / 10),
            child: Text(
              "COİN-BURADA",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10 / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Kripto para takip uygulaması",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10 / 10,
          ),
          Container(
            child: Text(
              " COIN BURADA Kripto  para takip uygulaması \n Kripto paraların günlük degerleri , günlük olarak çıktıkları ve indikleri en yüksek degerlerin gösterilldigi uygulama ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "COIN TEST ",
                  style: TextStyle(color: Colors.blue),
                ),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Test()),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
