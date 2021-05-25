import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../core/constants/enums.dart';
import '../../../core/misc/validators.dart';
import '../../../logic/cubit/authentication_cubit.dart';
import '../../../logic/cubit/visit_recorder_cubit.dart';
import '../../routers/app_router.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_loading.dart';
import '../../widgets/default_text_input_field.dart';
import 'widgets/custom_toggle.dart';

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          showDefaultLoadingDialog(
              context: context, title: 'Creating user account');
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
          Navigator.of(context).pushNamedAndRemoveUntil(
              state.user.accountType == AccountType.customer
                  ? AppRouter.customer_dashboard
                  : AppRouter.merchant_dashboard,
              (_) => false);
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
                  Text(
                    'Register User',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: size.height * 0.05,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        DefaulTextInputField(
                          textInputType: TextInputType.text,
                          hintText: 'Name',
                          validator: Validators.validateUserName,
                          onSaved: (String value) => userName = value,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DefaulTextInputField(
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Email',
                          validator: Validators.validateEmail,
                          onSaved: (String value) => email = value,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DefaulTextInputField(
                          textInputType: TextInputType.visiblePassword,
                          hintText: 'Password',
                          isPassword: true,
                          validator: Validators.validatePassword,
                          onSaved: (String value) => password = value,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DefaulTextInputField(
                          textInputType: TextInputType.phone,
                          hintText: 'Phone Number',
                          validator: Validators.validatePhoneNumber,
                          onSaved: (String value) => phoneNumber = value,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Account type',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: NeumorphicTheme.defaultTextColor(context),
                            fontFamily: 'Poppins',
                          ),
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
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, AppRouter.login),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Poppins',
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
