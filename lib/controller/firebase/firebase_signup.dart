import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  final uid = FirebaseAuth.instance.currentUser!.uid.toString();
  User? get user => _user;
  bool isLoading = false;
  AuthService() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // ZBotToast.showToastError(message: e.toString());
    }
  }

  Future<void> registerWithEmail(
      String name, String email, String password) async {
    // isLoading = true;
    // notifyListeners();
    debugger();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('Success Fully Registered');
      // isLoading = false;
      // notifyListeners();
      // await FirebaseFirestore.instance.collection('users').doc(uid).set({
      //   "Name": name,
      //   "ProfileImg": '',
      //   "CurrentBalance": 0,
      //   "MonthlyLimit": 0,
      // });
      // print('Success Fully Store Data');
    } catch (e) {
      // ZBotToast.showToastError(message: e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
