import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_basket_app/consts/consts.dart';

class AuthController extends GetxController {
/*

  //text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
//login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
*/
  //signup method

/*
  Future<UserCredential?> signupMethod(
    BuildContext context, {
    email,
    password,
  }) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
*/
  // My version of Signup Method

  // final FirebaseAuth _auth = FirebaseAuth.instance; [Firebase consts auth*]

  Future<User?> signUpMethodMine(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        VxToast.show(context, msg: "No Internet Connection");
      }
      if (e.code == 'email-already-in-use') {
        VxToast.show(context, msg: "Email ALready Exists");
      }
      if (e.code == 'invalid-email') {
        VxToast.show(context, msg: "Invalid Email address");
      }
      if (e.code == 'weak-password') {
        VxToast.show(context, msg: "Weak Password");
      }
      return null;
    }
  }

  //  My Version of Login Method

  Future<User?> loginWithEmailPasswordMine(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: "Error Login");
      return null;
    }
  }

  //storing data method

  storeUserData({name, password, email}) async {
    DocumentReference store =
        await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set(
        {'name': name, 'password': password, 'email': email, 'imageUrl': ''});
  }

  //signout method
  signoutMethod(
      {context, required String email, required String password}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: toString());
    }
  }
}
