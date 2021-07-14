import 'package:flutter/material.dart';
import 'package:climate/utilities/constants.dart';

class cityScreen extends StatefulWidget {
  @override
  _cityScreenState createState() => _cityScreenState();
}

class _cityScreenState extends State<cityScreen> {
  String cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/city.jpeg'),
          fit: BoxFit.cover,
        )),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: ktextFieldinputDecoration,
                onChanged: (value) {
                  cityname = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, cityname);
              },
              child: Text(
                "GET WEATHER",
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            )
          ],
        )),
      ),
    );
  }
}
