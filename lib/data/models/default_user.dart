import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../core/constants/enums.dart';

class DefaultUser {
  final User user;
  final String name;
  final String email;
  final String phoneNumber;
  final String pincode;
  final AccountType accountType;
  DefaultUser({
    @required this.user,
    @required this.name,
    @required this.email,
    @required this.phoneNumber,
    @required this.pincode,
    @required this.accountType,
  });

  DefaultUser.fromDocumentReference({
    @required User user,
    @required DocumentSnapshot<Map<String, dynamic>> documentSnapshot,
  })  : this.user = user,
        this.name = documentSnapshot.data()['name'],
        this.email = documentSnapshot.data()['email'],
        this.phoneNumber = documentSnapshot.data()['phone_number'],
        this.pincode = documentSnapshot.data()['pincode'],
        this.accountType = documentSnapshot.data()['is_merchant']
            ? AccountType.merchant
            : AccountType.customer;
}
