import '../styles/colorandstyles.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final double number;
  final Color color;
  final String title;
  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Text(title, style: kSubTextStyle),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 15,
            color: color,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
