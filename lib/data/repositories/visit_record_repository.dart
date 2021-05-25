import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data_providers/firebase_visit_record_api.dart';
import '../models/default_user.dart';
import '../models/visit_record.dart';

class VisitRecordRepository {
  final FirebaseVisitRecordApi _fireBaseVisitRecordApi =
      FirebaseVisitRecordApi();
  Future<List<VisitRecord>> loadVisitData({@required String uid}) async {
    List<VisitRecord> visitRecords = [];
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _fireBaseVisitRecordApi.loadVisitData(uid: uid);
    for (final visit in documentSnapshot.data()['visits']) {
      visitRecords.add(VisitRecord.fromMap(map: {
        'id': visit['id'],
        'mobile_number': visit['mobile_number'],
        'time': visit['time'],
      }));
    }
    return visitRecords;
  }

  Future<void> scanData(
      {@required DefaultUser user,
      @required scanid,
      @required String time}) async {
    return await _fireBaseVisitRecordApi.addVisitData(
        user: user, scanid: scanid, time: time);
  }

  Future<void> removeData(
      {@required String uid, @required Map<String, String> data}) async {
    return await _fireBaseVisitRecordApi.removeVisitData(uid: uid, data: data);
  }
}
