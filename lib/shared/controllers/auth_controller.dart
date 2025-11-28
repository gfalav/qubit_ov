import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      }
    });
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
        'SignUpError',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
