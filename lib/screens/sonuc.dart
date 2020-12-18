import 'package:coinsburada/main.dart';
import 'package:flutter/material.dart';

class SonucSayfa extends StatelessWidget {
  String text;
  SonucSayfa({this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }),
      ),
      body: Center(
        child: Container(
          child: Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
