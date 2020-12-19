import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coinsburada/screens/sonuc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/coins.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int index = 0;
  String coin = "Bitcoin";
  int counter_yes = 0;

  String city = "";
  Future<List<Soru>> getsoru() async {
    var response = await DefaultAssetBundle.of(context)
        .loadString("lib/assets/sorular.json");
    var jsonReponse = convert.json.decode(response);

    List<Soru> sorular = [];
    for (Map<String, dynamic> data in jsonReponse) {
      Soru soru = Soru.fromJson(data);
      sorular.add(soru);
    }
    return sorular;
  }

  Future<List<Coins>> coins() async {
    var url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
    var response = await http.get(url);
    //debugPrint(response.body);
    var jsonResponse = convert.json.decode(response.body);

    List<Coins> datas = [];
    for (var u in jsonResponse) {
      Coins coins = Coins.fromJson(u);
      datas.add(coins);
    }
    int range = datas.length;
    datas.removeRange(100, range);

    return datas;
  }

  Future<List<DropdownMenuItem>> getcoin() async {
    List<Coins> datas = await coins();
    List<Map<String, dynamic>> maps = [];
    for (int i = 0; i <= 99; i++) {
      maps.add({'name': datas[i].name});
    }
    List<DropdownMenuItem<String>> coin_namelist = [];
    for (var coin in maps) {
      coin_namelist.add(
          DropdownMenuItem(child: Text(coin["name"]), value: coin["name"]));
    }
    return coin_namelist;
  }

  Future<void> sonuc(String city) async {
    await Firebase.initializeApp();
    CollectionReference reference =
        FirebaseFirestore.instance.collection("CoinsMap");

    var snapshot = await reference.doc(city).get();
    if (snapshot.exists) {
      await reference
          .doc(city)
          .update({'probably_owner': FieldValue.increment(1)});
    } else {
      await reference.doc(city).set({'probably_owner': 1});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: city == ""
            ? FutureBuilder(
                future: getcoin(),
                builder: (context, snapshopt) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Teste Başlamadan önce Sahip oldgunuz  Parayı seçiniz ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        DropdownButton(
                          value: coin,
                          items: snapshopt.data,
                          onChanged: (value) {
                            setState(() {
                              coin = value;
                            });
                          },
                        ),
                        RaisedButton(
                          color: Colors.red,
                          child: Text(
                            "Basla",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              city = coin;
                            });
                          },
                        )
                      ],
                    ),
                  );
                },
              )
            : FutureBuilder(
                future: getsoru(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Soru> sorular = snapshot.data;
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    0.40 /
                                    10),
                            height: MediaQuery.of(context).size.height * 8 / 10,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        9 /
                                        10,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 60),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.red, width: 4),
                                    ),
                                    child: Text(
                                      "${sorular[index].soru}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                3 /
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                4.50 /
                                                10,
                                        child: RaisedButton(
                                          elevation: 20,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          color: Colors.red,
                                          onPressed: () async {
                                            setState(() {
                                              if (index == 9 &&
                                                  counter_yes >=
                                                      6) /////////////
                                              {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SonucSayfa(
                                                                text:
                                                                    "Vermiş olduğunuz cevaplardan göre kripto parayı ya sahipsiiniz ya da çok  meraklı birisiniz size tavsiyem en yakın zamanda  kripto para  En yakın zamanda yatırımlarınız bu yönde seçmeniz verya devam ettirmeniz "))); //////////////////////////////
                                              } else if (index == 9 &&
                                                  counter_yes <= 4) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SonucSayfa(
                                                                text:
                                                                    "Vermiş olduğunuz cevaplara göre Sanırım biraz daha arştırmanınz ve daha sonrasında kripto para yatımınızı düşünmenizi tavsiye ediyoruz  ")));
                                              } /////////////
                                              else //////////////
                                              {
                                                index = index + 1;
                                                counter_yes++;
                                              }
                                            });
                                            if (counter_yes == 4) {
                                              await sonuc(city);
                                            }
                                          },
                                          child: Text(
                                            "${sorular[index].evet}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                3 /
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                4.50 /
                                                10,
                                        child: RaisedButton(
                                          elevation: 20,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              if (index == 9 &&
                                                  counter_yes >= 7) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SonucSayfa(
                                                                text:
                                                                    "Vermiş olduğunuz cevaplardan göre Covid-19 riski taşıyor olabilirsiniz. En yakın sağlık kuruluşuna başvurunuz yada belirtileriniz hafif geçiyor ise kendinizi evinizde izole ediniz"))); //////////////////////////////

                                              } else if (index == 9 &&
                                                  counter_yes <= 7) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SonucSayfa(
                                                                text:
                                                                    "Vermiş olduğunuz cevaplara göre Covid-19 riski taşımamakta yada hafif geçirmektesiz. Eğer durumunuzun kötü olduğunu veya daha sonradan kötüleştiğini hissederseniz en yakın sağlık kuruluşuna başvurunuz")));
                                              } else {
                                                index = index + 1;
                                              }
                                            });
                                          },
                                          child: Text(
                                            "${sorular[index].hayir}",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
      ),
    );
  }
}

class Soru {
  String soru;
  String evet;
  String hayir;

  Soru.fromJson(Map<String, dynamic> json) {
    soru = json['soru'];
    evet = json['evet'];
    hayir = json["hayir"];
  }
}
