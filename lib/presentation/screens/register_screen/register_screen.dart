import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scan_zeit/core/constants/enums.dart';
import 'package:scan_zeit/presentation/routers/app_router.dart';
import 'package:scan_zeit/logic/cubit/visit_recorder_cubit.dart';

import '../../../logic/cubit/authentication_cubit.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_input_field.dart';

class RegisterScreen extends StatefulWidget {
  static const route = 'register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String userName;
  String password;
  String phoneNumber;
  String pincode;
  AccountType accountType = AccountType.customer;
  // bool vaccinated;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          Alert(
            context: context,
            title: 'Creating User Account',
            content: Container(
              child: CircularProgressIndicator(),
            ),
          ).show();
        } else if (state is AuthenticationError) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          Alert(
              context: context,
              title: state.message,
              type: AlertType.error,
              buttons: <DialogButton>[
                DialogButton(
                    child: Text(
                      'OK',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () => Navigator.pop(context))
              ]).show();
        } else if (state is Authenticated) {
          BlocProvider.of<VisitRecorderCubit>(context)
              .loadData(uid: state.user.user.uid);
          Navigator.pushReplacementNamed(
              context,
              state.user.accountType == AccountType.customer
                  ? AppRouter.customer_dashboard
                  : AppRouter.merchant_dashboard);
        }
      },
      child: Scaffold(
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        DefaulTextInputField(
                          hintText: 'Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (String value) => userName = value,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DefaulTextInputField(
                          hintText: 'Email',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (String value) => email = value,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DefaulTextInputField(
                          hintText: 'Password',
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (String value) => password = value,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DefaulTextInputField(
                          hintText: 'Phone Number',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (String value) => phoneNumber = value,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomToggle(
                          onChanged: (int value) {
                            (value == 0)
                                ? accountType = AccountType.customer
                                : accountType = AccountType.merchant;
                          },
                        ),
                        // RadioListTile(
                        //   activeColor: Theme.of(context).primaryColor,
                        //   title: Text('Customer'),
                        //   shape: OutlineInputBorder(
                        //     borderSide: BorderSide.none,
                        //     borderRadius: BorderRadius.circular(10.0),
                        //   ),
                        //   groupValue: accountType,
                        //   value: AccountType.customer,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       accountType = value;
                        //     });
                        //   },
                        // ),
                        // RadioListTile(
                        //   activeColor: Theme.of(context).primaryColor,
                        //   shape: CircleBorder(),
                        //   title: Text('Merchant'),
                        //   groupValue: accountType,
                        //   value: AccountType.merchant,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       accountType = value;
                        //     });
                        //   },
                        // ),
                        // RadioListTile(
                        //   selectedTileColor: Theme.of(context).primaryColor,
                        //   title: Text('Vaccinated'),
                        //   shape: OutlineInputBorder(
                        //     borderSide: BorderSide.none,
                        //     borderRadius: BorderRadius.circular(10.0),
                        //   ),
                        //   groupValue: vaccinated,
                        //   value: true,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       vaccinated = value;
                        //     });
                        //   },
                        // ),
                        // RadioListTile(
                        //   selectedTileColor: Theme.of(context).primaryColor,
                        //   shape: CircleBorder(),
                        //   title: Text('Not Vaccinated'),
                        //   groupValue: vaccinated,
                        //   value: false,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       vaccinated = value;
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DefaultButton(
                        text: 'Register',
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            BlocProvider.of<AuthenticationCubit>(context)
                                .signUp(
                              email: email,
                              password: password,
                              name: userName,
                              phoneNumber: phoneNumber,
                              pincode: pincode,
                              accountType: accountType,
                            );
                          }
                        },
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
                          GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, AppRouter.login),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
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
      ),
    );
  }
}

class CustomToggle extends StatefulWidget {
  final Function onChanged;
  CustomToggle({@required this.onChanged});
  @override
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NeumorphicToggle(
      style: NeumorphicToggleStyle(
          //backgroundColor: Colors.red,
          ),
      selectedIndex: _selectedIndex,
      displayForegroundOnlyIfSelected: true,
      children: [
        ToggleElement(
          background: Center(
              child: Text(
            "Customer",
            style: TextStyle(fontWeight: FontWeight.w500),
          )),
          foreground: Center(
              child: Text(
            "Customer",
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
        ),
        ToggleElement(
          background: Center(
              child: Text(
            "Merchant",
            style: TextStyle(fontWeight: FontWeight.w500),
          )),
          foreground: Center(
              child: Text(
            "Merchant",
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
        )
      ],
      thumb: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.all(Radius.circular(12))),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _selectedIndex = value;
          widget.onChanged(value);
        });
      },
    );
  }
}
