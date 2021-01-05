import 'package:covid19_app/widgets/secondPageView.dart';
import 'package:covid19_app/widgets/thirdPageView.dart';
import 'package:covid19_app/widgets/topPageView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              TopPageView(),
              SizedBox(
                height: 20,
              ),
              SecondPageView(),
              SizedBox(
                height: 10,
              ),
              ThirdPageView(),
            ],
          ),
        ),
      ),
    );
  }
}
