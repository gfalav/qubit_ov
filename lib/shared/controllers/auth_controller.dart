import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/ui/auth/sign_in.dart';
import 'package:qubit_ov/shared/ui/home/home.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final uid = ''.obs;

  final emailController = TextEditingController(text: 'gfalav@yahoo.com');
  final passwordController = TextEditingController(text: 'pppppppp');
  final repasswordController = TextEditingController(text: 'pppppppp');

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        uid.value = '';
      } else if (user.emailVerified) {
        uid.value = user.uid;
      } else {
        uid.value = '';
        Get.snackbar(
          'EmailNotVerified',
          'Please verify your email before signing in.',
          duration: const Duration(seconds: 5),
          backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
    ever(uid, (callback)=> isLoggedIn());
  }

  void isLoggedIn() {
    if (uid.value != '') {
      Get.offAll(Home());
    } else {
      Get.offAll(SignIn());
    }
  }

  Future<void> signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await _auth.currentUser!.sendEmailVerification();
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Sign Up Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Sign In Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Password Reset Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> updatePassword() async {
    try {
      await _auth.currentUser!.updatePassword(passwordController.text);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Update Password Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } 

Future<void> resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar(
        'Password Reset',
        'A password reset email has been sent to ${emailController.text}.',
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.primaryContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Password Reset Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
