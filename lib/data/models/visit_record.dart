import 'package:flutter/material.dart';

class VisitRecord {
  final String id;
  final String mobileNumber;
  final DateTime time;
  VisitRecord(
      {@required this.id, @required this.time, @required this.mobileNumber});
  VisitRecord.fromMap({@required Map<String, String> map})
      : this.id = map['id'],
        // this.merchant = map['merchant'],
        this.mobileNumber = map['mobile_number'],
        this.time = DateTime.parse(map['time']) {
    print('Got Map $map');
    print('Got Map ${this.id}');
  }
}
