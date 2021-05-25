import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scan_zeit/presentation/routers/app_router.dart';

import '../../widgets/default_button.dart';

class IntroScreen extends StatelessWidget {
  static const route = 'intro';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    NeumorphicText(
                      'Scan-Zeit',
                      textStyle:
                          NeumorphicTextStyle(fontSize: size.height * 0.08),
                      style: NeumorphicStyle(depth: size.height * 0.003),
                    ),
                    Text(
                      'TRACK YOUR VISITS',
                      style: TextStyle(
                          color: Colors.grey[800], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Neumorphic(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/svg/cart.svg')),
                DefaultButton(
                  text: 'Get Started',
                  onTap: () => Navigator.pushNamed(context, AppRouter.register),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
