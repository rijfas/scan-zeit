import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomToggle extends StatefulWidget {
  final Function onChanged;
  CustomToggle({@required this.onChanged});
  @override
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NeumorphicToggle(
      selectedIndex: _selectedIndex,
      displayForegroundOnlyIfSelected: true,
      children: [
        ToggleElement(
          background: Center(
              child: Text(
            "Customer",
            style:
                TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
          )),
          foreground: Center(
              child: Text(
            "Customer",
            style:
                TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
          )),
        ),
        ToggleElement(
          background: Center(
              child: Text(
            "Merchant",
            style:
                TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
          )),
          foreground: Center(
              child: Text(
            "Merchant",
            style:
                TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
          )),
        )
      ],
      thumb: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.all(Radius.circular(12))),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _selectedIndex = value;
          widget.onChanged(value);
        });
      },
    );
  }
}
