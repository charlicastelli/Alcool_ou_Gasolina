import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'Text.dart';
import 'button.dart';

class SubmitForm extends StatelessWidget {
  var gasCtrl = MoneyMaskedTextController();
  var alcCtrl = MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
   @required this.gasCtrl,
   @required this.alcCtrl,
   @required this.busy,
   @required this.submitFunc,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Texto(
            ctrl: gasCtrl,
            label: "Gasolina",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Texto(
            ctrl: alcCtrl,
            label: "Álcool",
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoadButton(
          busy: busy,
          func: submitFunc,
          text: "CALCULAR",
          invert: false,
        )
      ],
    );
  }
}
