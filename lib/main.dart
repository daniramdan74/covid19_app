
import 'package:covid19_app/const/constant.dart';
import 'package:covid19_app/screens/homePage.dart';
import 'package:covid19_app/screens/info.dart';
import 'package:covid19_app/screens/news.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _page = [
    HomePage(),
    NewsPage(),
    InfoPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimary2Color,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.chat),
              title: new Text('News'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.info),
              title: new Text('Info'),
            ),
          ]),
    );
  }
}
