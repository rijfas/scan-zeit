import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../logic/cubit/authentication_cubit.dart';
import '../../../logic/cubit/visit_recorder_cubit.dart';
import '../../routers/app_router.dart';

class QrScanScreen extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  static const route = 'qr_scan';
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Scan Merchant QR'),
      ),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, authenticationState) {
        if (authenticationState is Authenticated) {
          return Center(
              child: BlocListener<VisitRecorderCubit, VisitRecorderState>(
            listener: (context, state) {
              if (state is VisitRecorderScanned) {
                BlocProvider.of<VisitRecorderCubit>(context)
                    .loadData(uid: authenticationState.user.user.uid);
                Navigator.of(context)
                    .pushReplacementNamed(AppRouter.customer_dashboard);
              }
            },
            child: Stack(
              children: [
                Container(
                  child: QRView(
                      key: qrKey,
                      onQRViewCreated: (QRViewController controller) {
                        controller.scannedDataStream.listen((scanData) {
                          controller.dispose();
                          BlocProvider.of<VisitRecorderCubit>(context).scanData(
                              user: authenticationState.user,
                              scanid: scanData.code);
                        });
                      }),
                ),
                Container(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.6,
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 4.0,
                            )),
                      ),
                      Text(
                        'Scan Merchant QR-CODE',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ));
        } else {
          return Text('Authentication Error');
        }
      }),
    );
  }
}
