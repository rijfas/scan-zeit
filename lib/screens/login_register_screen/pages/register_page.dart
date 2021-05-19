import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:scan_zeit/core/misc/constants.dart';

import '../../global/widgets/toggle_button.dart';
import '../widgets/default_text_input_field.dart';
import '../widgets/custom_check_button.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/svg/register.svg'),
                Column(
                  children: [
                    DefaulTextInputField(hintText: 'Email'),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaulTextInputField(hintText: 'Name'),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaulTextInputField(
                      hintText: 'Password',
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaulTextInputField(hintText: 'Pincode'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 2,
                            child: DefaulTextInputField(
                                hintText: 'Vaccination Status')),
                        Expanded(
                          child: CustomCheckButton(checked: true),
                        ),
                        Expanded(
                          child: CustomCheckButton(),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ToggleButton(
                      text: 'Register',
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
                          'Already have an account? ',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          'Login',
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
        ),
      ),
    );
  }
}
