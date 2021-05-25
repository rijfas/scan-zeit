import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scan_zeit/core/misc/validators.dart';
import 'package:scan_zeit/logic/cubit/visit_recorder_cubit.dart';
import 'package:scan_zeit/presentation/widgets/default_loading.dart';

import '../../../core/constants/enums.dart';
import '../../../core/misc/validators.dart';
import '../../../logic/cubit/authentication_cubit.dart';
import '../../routers/app_router.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_input_field.dart';

class LoginScreen extends StatefulWidget {
  static const route = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          showDefaultLoadingDialog(context: context, title: 'Signing In...');
        } else if (state is AuthenticationError) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          Alert(
              closeIcon: SizedBox(),
              context: context,
              title: 'Error!',
              content: Text('${state.message}'),
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
          padding: const EdgeInsets.all(10.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Neumorphic(
                    margin: EdgeInsets.all(size.width * 0.1),
                    child: SvgPicture.asset('assets/svg/sign_in.svg')),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DefaulTextInputField(
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Email',
                        validator: Validators.validateEmail,
                        onSaved: (String value) => email = value,
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      DefaulTextInputField(
                        textInputType: TextInputType.visiblePassword,
                        hintText: 'Password',
                        validator: Validators.validatePassword,
                        onSaved: (String value) => password = value,
                        isPassword: true,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultButton(
                      text: 'Login',
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          BlocProvider.of<AuthenticationCubit>(context)
                              .signIn(email: email, password: password);
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
                          'Don\'t have an account? ',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRouter.register),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
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
