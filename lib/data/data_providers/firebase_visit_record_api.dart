import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../models/default_user.dart';

class FirebaseVisitRecordApi {
  final _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> loadVisitData(
      {@required String uid}) async {
    return await _firestore.collection('/users').doc(uid).get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> loadSingleData(
      {@required String uid}) async {
    DocumentReference<Map<String, dynamic>> _documentReference =
        _firestore.collection('/users').doc(uid);
    return await _documentReference.get();
  }

  Future<bool> addVisitData(
      {@required DefaultUser user,
      @required String scanid,
      @required String time}) async {
    final DefaultUser merchant = DefaultUser.fromDocumentReference(
        user: user.user, documentSnapshot: await loadSingleData(uid: scanid));
    await _firestore.collection('/users').doc(user.user.uid).update({
      'visits': FieldValue.arrayUnion([
        {
          'id': merchant.name,
          'mobile_number': merchant.phoneNumber,
          'time': time,
        }
      ])
    });
    await _firestore.collection('/users').doc(scanid).update({
      'visits': FieldValue.arrayUnion([
        {
          'id': user.name,
          'mobile_number': user.phoneNumber,
          'time': time,
        }
      ])
    });
    return true;
  }

  Future<void> removeVisitData(
      {@required String uid, @required Map<String, String> data}) async {
    return await _firestore.collection('/users').doc(uid).update({
      'visits': FieldValue.arrayRemove([data]),
    });
  }
}
