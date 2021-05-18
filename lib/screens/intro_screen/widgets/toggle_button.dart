import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onToggle;
  final bool toggled;
  const ToggleButton({
    Key key,
    @required this.text,
    @required this.color,
    @required this.onToggle,
    this.toggled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: toggled ? color : Colors.white,
        padding: const EdgeInsets.all(20.0),
        side: BorderSide(
          color: color,
          width: 4.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: onToggle,
      child: Text(
        text,
        style: TextStyle(
          color: toggled ? Colors.white : color,
          fontWeight: FontWeight.bold,
          fontSize: size.height * 0.02,
        ),
      ),
    );
  }
}
