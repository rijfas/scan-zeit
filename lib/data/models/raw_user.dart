import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RawUser {
  final User user;
  final DocumentReference<Map<String, dynamic>> documentReference;
  RawUser({
    @required this.user,
    @required this.documentReference,
  });
}
