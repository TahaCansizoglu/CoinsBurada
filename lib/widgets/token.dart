import 'package:flutter/material.dart';

class TokenCard extends StatelessWidget {
  final String token,
      name,
      cryptoAmount,
      cryptoCurrency,
      usdAmount,
      cryptoIconURL;

  TokenCard(
      {Key key,
      this.token,
      this.name,
      this.cryptoAmount,
      this.cryptoCurrency,
      this.usdAmount,
      this.cryptoIconURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 21.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.all(21),
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.network(
                cryptoIconURL,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    token,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Text(
                    "$cryptoAmount $cryptoCurrency",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    "\$$usdAmount",
                    style: Theme.of(context).textTheme.subhead,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
