import 'package:flutter/material.dart';

class VisitRecord {
  final String customer;
  final String merchant;
  final String mobileNumber;
  final DateTime time;
  VisitRecord(
      {@required this.customer,
      @required this.merchant,
      @required this.time,
      @required this.mobileNumber});
  VisitRecord.fromMap({@required Map<String, String> map})
      : this.customer = map['customer'],
        this.merchant = map['merchant'],
        this.mobileNumber = map['mobile_number'],
        this.time = DateTime.parse(map['time']);

  // VisitRecord.fromDocumentSnapshot(
  //     {@required DocumentSnapshot<Map<String, dynamic>> documentSnapshot})
  //     : this.customer = null,
  //       this.merchant = null,
  //       this.time = null {
  //   print('Got the data ${documentSnapshot.data()['visits'].runtimeType}');
  //}
}
