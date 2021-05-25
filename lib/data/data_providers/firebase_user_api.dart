import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../models/raw_user.dart';

class FirebaseUserApi {
  final _authUser = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<RawUser> signIn(
      {@required String email, @required String password}) async {
    final _userCredential = await _authUser.signInWithEmailAndPassword(
        email: email, password: password);
    DocumentReference<Map<String, dynamic>> _documentReference =
        _firestore.collection('/users').doc(_userCredential.user.uid);
    return RawUser(
        user: _userCredential.user, documentReference: _documentReference);
  }

  Future<RawUser> signUp(
      {@required String email, @required String password}) async {
    final _userCredential = await _authUser.createUserWithEmailAndPassword(
        email: email, password: password);
    DocumentReference<Map<String, dynamic>> _documentReference =
        _firestore.collection('/users').doc(_userCredential.user.uid);
    return RawUser(
        user: _userCredential.user, documentReference: _documentReference);
  }

  Future<void> signOut() async {
    await _authUser.signOut();
  }
}
