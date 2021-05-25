import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../core/themes/app_theme.dart';
import '../../../logic/cubit/authentication_cubit.dart';
import '../../../logic/cubit/visit_recorder_cubit.dart';
import '../../routers/app_router.dart';
import '../../widgets/default_error_display.dart';

class QrDisplayScreen extends StatelessWidget {
  static const route = 'qr_display';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text(
          'Merchant Info',
          style: AppTheme.blodTextTheme,
        ),
      ),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
        if (state is Authenticated)
          return WillPopScope(
            onWillPop: () {
              BlocProvider.of<VisitRecorderCubit>(context)
                  .loadData(uid: state.user.user.uid);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRouter.merchant_dashboard, (_) => false);
              return Future.delayed(
                  const Duration(microseconds: 1), () => true);
            },
            child: Center(
              child: Neumorphic(
                style: NeumorphicStyle(intensity: 20.0),
                child: Container(
                  height: size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: 'qr',
                        child: PrettyQr(
                          size: size.height * 0.3,
                          typeNumber: 5,
                          roundEdges: true,
                          data: '${state.user.user.uid}',
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${state.user.name}',
                              style: AppTheme.blodTextTheme,
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
            ),
          );
        else
          return DefaultErrorDisplay();
      }),
    );
  }
}
