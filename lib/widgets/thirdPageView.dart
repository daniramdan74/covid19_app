import 'dart:convert';

import 'package:covid19_app/const/constant.dart';
import 'package:covid19_app/models/mProvince2.dart';
import 'package:covid19_app/service/apiService.dart';
import 'package:flutter/material.dart';

class ThirdPageView extends StatefulWidget {
  @override
  _ThirdPageViewState createState() => _ThirdPageViewState();
}

class _ThirdPageViewState extends State<ThirdPageView> {
  String key;
  int jumlahKasus;

  // Future<void> _fetchdata() async {
  //   final res = await ApiService().getDataUpdate('prov.json');
  //   if (res.statusCode == 200) {
  //     final json = jsonDecode(res.body);
  //     // print(json);
  //     final data = json['list_data'];
  //     print(data);
  //   }
  // }

  List<ListDatum> listCategory = [];
  Future<List<ListDatum>> _fetchdata2() async {
    final res = await ApiService().getDataUpdate('prov.json');
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      // print(json);
      // final data = json['list_data'];
      ProvinceModel respCategory = ProvinceModel.fromJson(json);
      print(json);
      respCategory.listData.forEach((item) {
        listCategory.add(item);
        
      });
      return listCategory;
    } else {
      print(res);
      print('something wrong');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    // _fetchdata2();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Top Province\n',
                  style: kTitleTextstyle,
                ),
                TextSpan(
                  text: 'Indonesia',
                  style: TextStyle(
                    color: kTextLightColor,
                  ),
                ),
              ])),
              Spacer(),
              Text(
                'View All >',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Container(
            height: 195.0,
            child: FutureBuilder<List<ListDatum>>(
                future: _fetchdata2(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Please Wait ....');
                  } else {
                    List<ListDatum> listCategory = snapshot.data;
                    return ListView.builder(
                        itemCount: listCategory?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          final x = listCategory[i];

                          return Card(
                              elevation: 3,
                              // color: Color(0xffe9f4f3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: SizedBox(
                                  width: 150,
                                  height: 160,
                                  child: Column(
                                    children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 1,
                                                      blurRadius: 5,
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset: Offset(0, 4))
                                                ],
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      '${x.flagPath}'),
                                                  fit: BoxFit.fill,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kInfectedColor.withOpacity(.26),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: kInfectedColor,
                                                width: 2)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      x.jumlahKasus.toString(),
                                      style: kSubText1Style,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(x.key, style: kSubText2Style,textAlign: TextAlign.center,)
                                  ])));
                        });
                  }
                }),
          ),
        ]));
  }
}
