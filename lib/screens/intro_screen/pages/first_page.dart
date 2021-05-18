import 'package:flutter/material.dart';

import '../../../core/misc/constants.dart';
import '../widgets/toggle_button.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Placeholder(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButton(
                  text: 'Customer',
                  color: kColorScheme[900],
                  onToggle: () {},
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ToggleButton(
                  text: 'Merchant',
                  color: kColorScheme[900],
                  onToggle: () {},
                  toggled: true,
                )
              ],
            ),
            ToggleButton(
              text: 'Get Started',
              color: kColorScheme[900],
              onToggle: () {},
              toggled: true,
            )
          ],
        ),
      ),
    );
  }
}
