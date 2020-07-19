import 'package:flutter/material.dart';
import 'package:buttons_experiment/classes/button_style.dart';

/// objectives
/// add touch animation
/// add loading state

class DisplacedButton extends StatefulWidget {
  final ButtonStyle style;
  final String text;
  final Function onTap;
  DisplacedButton(
      {this.style, this.text = "Custom button", this.onTap, Key key})
      : super(key: key);

  @override
  _DisplacedButtonState createState() => _DisplacedButtonState();
}

class _DisplacedButtonState extends State<DisplacedButton> {
  Offset _backgroundOffset = Offset(5, 5);

  void _handleButtonTap() {
    print("tapped");
  }

  void _handleButtonTapDown(TapDownDetails details) {
    setState(() {
      _backgroundOffset = Offset(0, 0);
    });
  }

  void _handleButtonTapUp(TapUpDetails details) {
    setState(() {
      _backgroundOffset = Offset(5, 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 700),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Transform.translate(
              offset: _backgroundOffset,
              child: Container(color: Colors.red),
            ),
          ),
          GestureDetector(
            onTap: _handleButtonTap,
            onTapUp: _handleButtonTapUp,
            onTapDown: _handleButtonTapDown,
            child: Container(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.style.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(border: Border.all(width: 2)),
            ),
          ),
        ],
      ),
    );
  }
}
