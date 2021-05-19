import 'package:flutter/material.dart';

import '../../../core/misc/constants.dart';

class CustomCheckButton extends StatelessWidget {
  final bool checked;

  const CustomCheckButton({Key key, this.checked = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: checked ? kColorScheme[900] : Colors.grey[700], width: 4.0),
      ),
      child: Icon(
        checked ? Icons.check : Icons.close,
        color: checked ? kColorScheme[900] : Colors.grey[700],
        size: 30.0,
      ),
    );
  }
}
