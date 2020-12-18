import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coinsburada/screens/sonuc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int index = 0;
  String sehir = "ADANA";
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

  Future<List<DropdownMenuItem>> getcity() async {
    var response = await DefaultAssetBundle.of(context)
        .loadString("lib/assets/iller.json");
    var jsonResponse = convert.json.decode(response);
    List<DropdownMenuItem<String>> citys = [];
    for (var city in jsonResponse.keys) {
      citys.add(DropdownMenuItem(
        child: Text(jsonResponse[city]),
        value: jsonResponse[city],
      ));
    }
    return citys;
  }

  Future<void> sonuc(String city) async {
    await Firebase.initializeApp();
    CollectionReference reference =
        FirebaseFirestore.instance.collection("CovidMap");

    var snapshot = await reference.doc(city).get();
    if (snapshot.exists) {
      await reference
          .doc(city)
          .update({'possibly_infected': FieldValue.increment(1)});
    } else {
      await reference.doc(city).set({'possibly_infected': 1});
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
                future: getcity(),
                builder: (context, snapshopt) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Teste Başlamadan önce İlerde daha iyi hizmet saglamamız için Lütfen Bulundugunuz ili seçiniz ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        DropdownButton(
                          value: sehir,
                          items: snapshopt.data,
                          onChanged: (value) {
                            setState(() {
                              sehir = value;
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
                              city = sehir;
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
                                                                    "Vermiş olduğunuz cevaplardan göre Covid-19 riski taşıyor olabilirsiniz. En yakın sağlık kuruluşuna başvurunuz yada belirtileriniz hafif geçiyor ise kendinizi evinizde izole ediniz"))); //////////////////////////////
                                              } else if (index == 9 &&
                                                  counter_yes <= 4) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SonucSayfa(
                                                                text:
                                                                    "Vermiş olduğunuz cevaplara göre Covid-19 riski taşımamakta yada hafif geçirmektesiz. Eğer durumunuzun kötü olduğunu veya daha sonradan kötüleştiğini hissederseniz en yakın sağlık kuruluşuna başvurunuz")));
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
                                            "Evet",
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
                                            "Hayır",
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

  Soru.fromJson(Map<String, dynamic> json) {
    soru = json['soru'];
  }
}
