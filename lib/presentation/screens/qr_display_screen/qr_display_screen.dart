import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../logic/cubit/authentication_cubit.dart';

class QrDisplayScreen extends StatelessWidget {
  static const route = 'qr_display';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Merchant-Info'),
      ),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
        if (state is Authenticated)
          return Center(
            child: Neumorphic(
              style: NeumorphicStyle(intensity: 20.0),
              child: Container(
                height: size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    PrettyQr(
                      size: size.height * 0.3,
                      typeNumber: 5,
                      roundEdges: true,
                      data: '${state.user.user.uid}',
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${state.user.name}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text('${state.user.phoneNumber}'),
                          SizedBox(height: size.height * 0.01),
                          Text('${state.user.email}'),
                        ],
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ),
          );
        else
          return Text('Authentication Error');
      }),
    );
  }
}

class NeumorphicBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.all(18),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      child: Icon(
        Icons.arrow_back,
        color: NeumorphicTheme.isUsingDark(context)
            ? Colors.white70
            : Colors.black87,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
