import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../core/themes/app_theme.dart';
import '../../routers/app_router.dart';
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
                Neumorphic(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Scan-Zeit',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      Text('TRACK YOUR VISITS',
                          style: AppTheme.blodTextTheme
                              .copyWith(color: Colors.grey[800])),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.3,
                  child: Swiper(
                    itemHeight: size.height * 0.3,
                    itemWidth: size.width * 0.3,
                    itemCount: 3,
                    autoplay: true,
                    itemBuilder: (context, index) => Container(
                      child:
                          SvgPicture.asset('assets/svg/slide_${index + 1}.svg'),
                    ),
                  ),
                ),
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
