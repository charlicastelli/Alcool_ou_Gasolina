import 'package:flutter/material.dart';

class LoadButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function func;
  var text;

  LoadButton({
   @required this.busy,
   @required this.func,
   @required this.invert,
   @required this.text,
});


  @override
  Widget build(BuildContext context) {
    return
      busy ? Container(
        alignment: Alignment.center,
        height: 50,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      )
      : Container(
        margin: EdgeInsets.all(30),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: invert
            ? Theme.of(context).primaryColor
            : Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(60)
        ),
        child: FlatButton(
//          splashColor: Colors.blue,
//          highlightColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60)
          ),

          child: Text(
            text,
            style: TextStyle(
                color: invert ? Colors.white
                : Theme.of(context).primaryColor,
                fontSize: 30,
                fontFamily: "Big Shoulders Display",
                fontWeight: FontWeight.bold
            ),
          ),
          onPressed: func,
        ),
      );
    }
}
