import 'package:flutter/material.dart';

import '../../core/constants/enums.dart';
import '../data_providers/firebase_user_api.dart';
import '../models/default_user.dart';

class UserRepository {
  FirebaseUserApi _firebaseUserApi = FirebaseUserApi();
  Future<DefaultUser> createAccount({
    @required String name,
    @required String email,
    @required String password,
    @required String phoneNumber,
    @required String pincode,
    @required AccountType accountType,
  }) async {
    final rawUser =
        await _firebaseUserApi.signUp(email: email, password: password);
    rawUser.documentReference.set({
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'pincode': pincode,
      'is_merchant': accountType == AccountType.merchant,
    });
    return DefaultUser(
      user: rawUser.user,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      pincode: pincode,
      accountType: accountType,
    );
  }

  Future<DefaultUser> signIn({
    @required String email,
    @required String password,
  }) async {
    final rawUser =
        await _firebaseUserApi.signIn(email: email, password: password);
    return DefaultUser.fromDocumentReference(
        user: rawUser.user,
        documentSnapshot: await rawUser.documentReference.get());
  }

  Future<void> signOut() async {
    await _firebaseUserApi.signOut();
  }
}
