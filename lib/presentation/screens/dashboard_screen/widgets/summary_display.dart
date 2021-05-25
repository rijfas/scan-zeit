import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SummaryDisplay extends StatelessWidget {
  final String title;
  final String subtitle;
  SummaryDisplay({@required this.title, @required this.subtitle});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Neumorphic(
      margin: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: size.height * 0.06,
                shadows: [
                  Shadow(
                      color: Colors.black38,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2)
                ],
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
            Divider(),
            Text(
              subtitle,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.02,
                  shadows: [
                    Shadow(
                        color: Colors.black38,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
