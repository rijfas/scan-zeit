import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SummaryDisplay extends StatelessWidget {
  final String title;
  final String subtitle;
  SummaryDisplay({@required this.title, @required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
            ),
            Divider(
              thickness: 3.0,
            ),
            Text(
              subtitle,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
