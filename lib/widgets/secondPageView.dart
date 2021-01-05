import 'dart:convert';

import 'package:covid19_app/const/constant.dart';
// import 'package:covid19_app/models/mPenambahan.dart';
import 'package:covid19_app/models/mSummary.dart';
import 'package:covid19_app/service/apiService.dart';
import 'package:covid19_app/widgets/counter.dart';
import 'package:flutter/material.dart';

class SecondPageView extends StatefulWidget {
  @override
  _SecondPageViewState createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView> {
  int jmlPositif, pJmlPositif;
  int jmlMeninggal, pJmlMeninggal;
  int jmlSembuh, pJmlSembuh;
  int jmlDirawat, pJmlDirawat;
  String tanggal;

  Future<void> _fetchdata() async {
    final res = await ApiService().getDataUpdate('update.json');
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      setState(() {
        var update = json["update"];
        var dataTotal = update["total"];
        var dataUpdate = update["penambahan"];
        print(dataTotal);
        jmlPositif = dataTotal["jumlah_positif"];
        jmlMeninggal = dataTotal["jumlah_meninggal"];
        jmlSembuh = dataTotal["jumlah_sembuh"];
        jmlDirawat = dataTotal["jumlah_dirawat"];
        tanggal = dataUpdate["tanggal"];

        pJmlPositif = dataUpdate["jumlah_positif"];
        pJmlMeninggal = dataUpdate["jumlah_meninggal"];
        pJmlSembuh = dataUpdate["jumlah_sembuh"];
        pJmlDirawat = dataUpdate["jumlah_dirawat"];
      });
      // print(tanggal);

      // var keyList = dataList.keys.toList();
      // var valueList = dataList.values.toList();
      // finalData.clear();
      // for (int i = 0; i < keyList.length; ++i) {
      // finalData.add(
      //     '${keyList[i][0].toUpperCase()}${keyList[i].substring(1)} : ${valueList[i]}');
      // }

      // print(dataList);
      return json;
    } else {
      print(res);
      print('something wrong');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 310,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 3,
              // color: Color(0xffe9f4f3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                width: 400,
                height: 310,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 30, color: kShadowColor)
              ],
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Case Update\n',
                        style: kTitleTextstyle,
                      ),
                      TextSpan(
                        text: 'Newest Update : $tanggal',
                        style: TextStyle(
                          color: kTextLightColor,
                        ),
                      ),
                    ])),
                    Spacer(),
                    Text(
                      'See details',
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Counter(
                  color: kInfectedColor,
                  number: jmlPositif,
                  penambahan: pJmlPositif,
                  title: 'infected',
                ),
                SizedBox(
                  height: 10,
                ),
                Counter(
                  color: kTreated,
                  number: jmlDirawat,
                  penambahan: pJmlDirawat,
                  title: "Hospitalize",
                ),
                SizedBox(
                  height: 10,
                ),
                Counter(
                  color: kDeathColor,
                  number: jmlMeninggal,
                  penambahan: pJmlMeninggal,
                  title: "Deaths",
                ),
                SizedBox(
                  height: 10,
                ),
                Counter(
                  color: kRecovercolor,
                  number: jmlSembuh,
                  penambahan: pJmlSembuh,
                  title: "Recovered",
                ),
              ],
            ),
          )

          // Align(
          //   alignment: Alignment(0.87, 1),
          //   child: Container(
          //height: 150,
          //width: 90,
          //     child: Image.asset(
          //   'assets/logo.png',
          // )
          //   ),
          // ),
        ],
      ),
    );
  }
}
