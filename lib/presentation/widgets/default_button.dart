import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../core/themes/app_theme.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const DefaultButton({
    @required this.text,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.all(10.0),
      style: NeumorphicStyle(depth: 5.0),
      onPressed: onTap,
      child: Center(
        child: AutoSizeText(
          text,
          minFontSize: 30.0,
          maxLines: 1,
          style: AppTheme.blodTextTheme,
        ),
      ),
    );
  }
}
