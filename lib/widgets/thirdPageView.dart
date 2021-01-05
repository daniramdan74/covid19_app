import 'package:covid19_app/const/constant.dart';
import 'package:covid19_app/widgets/topProvinceCard.dart';
import 'package:flutter/material.dart';

class ThirdPageView extends StatefulWidget {
  @override
  _ThirdPageViewState createState() => _ThirdPageViewState();
}

class _ThirdPageViewState extends State<ThirdPageView> {
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
          Row(
            children: <Widget>[
              TopProvinceCard(
                number: 789797,
                flagPath: 'assets/flags/id.png',
                province: 'DKI Jakarta',
              ),
            ],
          )
        ]));
  }
}
