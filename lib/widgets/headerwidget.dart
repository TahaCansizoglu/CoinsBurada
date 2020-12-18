import 'package:coinsburada/screens/testscreen.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 3.9 / 10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50 / 10,
          ),
          Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 6 / 10),
            child: Text(
              "COVID-19",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25 / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Kendinizi Hasta Hissediyormusunuz ?",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50 / 10,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              "Eger kendinizi hasta hissediyorsanız ve COVID kapmış olma ihtimaliniz varsa  sayfa içerisinde belirtilen COVID 19 belirtilerine bakınız ve gerek olursa yardım almak için iletişim numrasından  yetkilirle  irtibata geçiniz ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40 / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "COVID-19 ",
                  style: TextStyle(color: Colors.red),
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
