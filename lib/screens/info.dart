import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  PackageInfo packageInfo;
  bool gotInfo = false;
  void gitHub() async {
    const url = 'https://github.com/daniramdan74/covid19_app';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      height: 110,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "COVID19 App",
                      style: TextStyle(
                          color: Color(0xff057163),
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    Text(
                      "Version 1.0.0",
                      style: TextStyle(color: Color(0xff057163)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Covid-19 is an open source app made with Flutter framework to provide the status of Covid-19 pandemic in INdonesia. It shows all the affected, recovered and dead count for each province in Application. As it is an open source app feel free to contribute in GitHub.",
                      style: TextStyle(fontSize: 15, color: Color(0xff057163)),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: gitHub,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/github.png',
                              height: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Fork the project on GitHub",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.link)
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Made with "),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 16,
                        ),
                        Text(" by "),
                        Text(
                          "Dani Ramdan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )
              ])),
    ));
  }
}
