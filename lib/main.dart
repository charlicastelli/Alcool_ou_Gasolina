import 'package:flutter/material.dart';
import 'package:flutter_alcool_gasolina/form.dart';
import 'package:flutter_alcool_gasolina/logo.dart';
import 'package:flutter_alcool_gasolina/success.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Color _color = Colors.blue;
  var _gasCtrl = MoneyMaskedTextController();
  var _alcCtrl = MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(
              result: _resultText,
              reset: reset,
            )
                : SubmitForm(
              alcCtrl: _alcCtrl,
              gasCtrl: _gasCtrl,
              submitFunc: calculate,
              busy: _busy,
            )
          ],
        ),
      ),
    );
  }

  Future calculate(){
    double alc =
        double.parse(_alcCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      _color = Colors.black.withOpacity(0.9);
      _completed = false;
      _busy = true;
    });

    return Future.delayed(
      const Duration(milliseconds: 1300),
        () {
          setState(() {
            if (res >= 0.7) {
              _resultText = "Compensa utilizar gasolina!";
            } else {
              _resultText = "Compensa utilizar álcool!";
            }
            _busy = false;
            _completed = true;
          });
        }
    );
  }
  reset(){
    setState(() {
      _alcCtrl = MoneyMaskedTextController();
      _gasCtrl = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.blue;
    });
  }
}

