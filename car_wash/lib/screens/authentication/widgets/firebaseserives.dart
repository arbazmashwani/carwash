import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseException catch (error) {
      Fluttertoast.showToast(msg: error.message!, gravity: ToastGravity.BOTTOM);
      return false;
    }
  }

  void signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<void> saveUserDetails(String userId, String email, password,
      String firstname, String lastname, phone, gender) async {
    final userRef = _firestore.collection('users_details').doc(userId);
    await userRef.set({
      'email': email,
      'first_name': firstname,
      'last_name': lastname,
      'password': password,
      'phone': phone,
      'uid': userId,
      'classes_subscription': 'false',
      'banned': 'false',
      'created_at': DateTime.now().toString(),
      'super_donar': 'false',
      'gender': gender,
      'donation': '0',
      'top_user': 'false'
    });
  }
}
