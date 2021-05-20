import 'package:flutter/material.dart';

import '../../../core/misc/constants.dart';

class DefaulTextInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final Function validator;

  const DefaulTextInputField(
      {Key key,
      @required this.hintText,
      @required this.validator,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsetsDirectional.only(end: 12.0),
                child: Icon(
                  Icons.remove_red_eye_rounded,
                ),
              )
            : null,
        filled: true,
        fillColor: kColorScheme[50],
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
