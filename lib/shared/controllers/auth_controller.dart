import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/ui/auth/sign_in.dart';
import 'package:qubit_ov/shared/ui/home/home.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final uid = ''.obs;

  final emailController = TextEditingController(text: 'gfalav@yahoo.com');
  final passwordController = TextEditingController(text: 'Pppp1#');
  final repasswordController = TextEditingController(text: 'Pppp1#');
  final passwordObscure = true.obs;
  final repasswordObscure = true.obs;

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
        Get.to(SignIn());
        Get.snackbar(
          'EmailNotVerified',
          'Please verify your email before signing in.',
          duration: const Duration(seconds: 5),
          backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
    ever(uid, (callback) => isLoggedIn());
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

  Future<void> updatePassword() async {
    try {
      await _auth.currentUser!.updatePassword(passwordController.text);
      Get.to(Home());
      Get.snackbar(
        'Update Password',
        'Your password has been updated successfully.',
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.secondaryContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
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

  Future<void> sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar(
        'Password Reset',
        'A password reset email has been sent to ${emailController.text}.',
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.secondaryContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(SignIn());
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

  void setPasswordObscure() {
    passwordObscure.value = !passwordObscure.value;
  }

  void setRepasswordObscure() {
    repasswordObscure.value = !repasswordObscure.value;
  }
}
