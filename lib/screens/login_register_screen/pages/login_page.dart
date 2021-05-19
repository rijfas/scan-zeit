import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:scan_zeit/core/misc/constants.dart';

import '../../global/widgets/toggle_button.dart';
import '../widgets/default_text_input_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/svg/sign_in.svg'),
            Column(
              children: [
                DefaulTextInputField(hintText: 'Email'),
                SizedBox(
                  height: 10.0,
                ),
                DefaulTextInputField(
                  hintText: 'Password',
                  isPassword: true,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ToggleButton(
                  text: 'Login',
                  color: kColorScheme[900],
                  onToggle: () {},
                  toggled: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kColorScheme[900]),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
