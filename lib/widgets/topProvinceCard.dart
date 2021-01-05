
import 'package:covid19_app/const/constant.dart';
import 'package:flutter/material.dart';

class TopProvinceCard extends StatelessWidget {
  final int number;
  final String flagPath;
  final String province;

  const TopProvinceCard({
    Key key, this.number, this.flagPath, this.province,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Card(
            elevation: 3,
            // color: Color(0xffe9f4f3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
                width: 150,
                height: 180,
                child: Column(children: <Widget>[
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
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 4))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(flagPath),
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
                              color: kInfectedColor, width: 2)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$number',
                    style: TextStyle(
                      fontSize: 30,
                      color: kInfectedColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(province, style: kSubText2Style)
                ]
                )
                )
                )
                );
  }
}
