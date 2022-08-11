import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Image.asset(
          "assets/images/aog-white.png",
          height: 100,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Álcool ou Gasolina",
          style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: "Big Shoulders Display"
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
