import 'package:covid19_app/const/constant.dart';
import 'package:flutter/material.dart';

class TopPageView extends StatefulWidget {
  @override
  _TopPageViewState createState() => _TopPageViewState();
}

class _TopPageViewState extends State<TopPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 170,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            // child: Card(
            //   elevation: 10,
            //   color: Color(0xffe9f4f3),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20)

            //   ),
            //   child: SizedBox(
            //     width: 410,
            //     height: 160,

            //   ),
            // ),

            child: Container(
              width: 410,
              height: 160,
              decoration: BoxDecoration(
                  color: Color(0xffe9f4f3),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/virus.png'),
            )),
          ),
          Align(
            alignment: Alignment(0.87, 1),
            child: Container(
                //height: 150,
                //width: 90,
                child: Image.asset(
              'assets/logo.png',
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'All you need to',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Know About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Coronavirus!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                RaisedButton(
                  color: kInfectedColor,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text('Know More',
                      style: TextStyle(
                          fontSize: 12, letterSpacing: 1, color: Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
