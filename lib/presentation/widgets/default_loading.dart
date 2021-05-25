import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void showDefaultLoadingDialog(
    {@required BuildContext context, @required title}) {
  Alert(
    closeIcon: SizedBox(),
    context: context,
    title: title,
    content: Container(
      child: SpinKitDualRing(color: Theme.of(context).primaryColor),
    ),
  ).show();
}
