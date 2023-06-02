import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// This class extends ChangeNotifier so that u can notify any listeners whenever
// a user has logged in or logged out.
// The auth variable is used to hold on to an instance of FirebseAuth.
class UserDao extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  // Add helper methods

  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  String? userId() {
    return auth.currentUser?.uid;
  }

  String? email() {
    return auth.currentUser?.email;
  }
  // Add signup

  Future<String?> signup(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      return e.message;
    } catch (e) {
      log(
        e.toString(),
      );
      return e.toString();
    }
  }

  // Add login
  Future<String?> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      return e.message;
    } catch (e) {
      log(
        e.toString(),
      );
      return e.toString();
    }
  }

  // Add logout
  void logout() async {
    await auth.signOut();
    notifyListeners();
  }
}
