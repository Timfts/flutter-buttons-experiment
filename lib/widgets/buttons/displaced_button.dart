import 'package:flutter/material.dart';
import 'package:buttons_experiment/classes/button_style.dart';

class DisplacedButton extends StatelessWidget {
  final ButtonStyle style;
  final String text;

  DisplacedButton({this.style, this.text = "Custom button", Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Transform.translate(
              offset: Offset(5, 5),
              child: Container(color: Colors.red),
            ),
          ),
          Container(
            child: Text(
              this.text,
              style: TextStyle(
                  color: this.style.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(border: Border.all(width: 2)),
          ),
        ],
      ),
    );
  }
}
