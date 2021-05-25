import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DefaulTextInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final Function validator;
  final Function onSaved;
  final TextInputType textInputType;
  const DefaulTextInputField({
    Key key,
    @required this.hintText,
    @required this.validator,
    @required this.onSaved,
    @required this.textInputType,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            hintText,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: NeumorphicTheme.defaultTextColor(context),
                fontFamily: 'Poppins'),
          ),
        ),
        Neumorphic(
          margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
          style: NeumorphicStyle(
            depth: -2.0,
            boxShape: NeumorphicBoxShape.stadium(),
          ),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          child: TextFormField(
            keyboardType: textInputType,
            validator: validator,
            onSaved: onSaved,
            obscureText: isPassword,
            decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: TextStyle(fontFamily: 'Poppins')),
          ),
        )
      ],
    );
  }
}
