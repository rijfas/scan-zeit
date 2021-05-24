import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                SvgPicture.asset('assets/svg/cart.svg'),
                DefaultButton(
                  text: 'GetStarted',
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
