import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Info'),),
      body: Center(
        child: Text('Info'),
      ),
    );

  }
}