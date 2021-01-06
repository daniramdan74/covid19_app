import 'package:flutter/material.dart';

class CreditScreenPage extends StatefulWidget {
  @override
  _CreditScreenPageState createState() => _CreditScreenPageState();
}

class _CreditScreenPageState extends State<CreditScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30,50,30,30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/logo.png',height: 110,),
              SizedBox(height: 15,),
              Text(
                "COVID-19",
                style: TextStyle(
                  color: Color(0xff057163),
                  fontWeight: FontWeight.w600,
                  fontSize: 24
                ),
              ),
              Text("Version 1.0.0"),
              SizedBox(height: 20,),
              Text(
                "Covid-19 is an open source app made with Flutter framework to provide the status of Covid-19 pandemic all over the world. It shows all the affected, recovered and dead count for each country in a form of graph. As it is an open source app feel free to contibute in GitHub.",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff057163)
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  //github
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/github.png',height: 25,),
                      SizedBox(width: 10,),
                      Text("Fork the project on GitHub",style: TextStyle(fontSize: 20),),
                      SizedBox(width: 5,),
                      Icon(Icons.link)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Made with "),
                  Icon(Icons.favorite,color: Colors.red,size: 16,),
                  Text(" by "),
                  Text("Dani Ramdan",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}