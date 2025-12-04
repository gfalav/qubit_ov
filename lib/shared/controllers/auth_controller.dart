import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qubit_ov/shared/ui/auth/sign_in.dart';
import 'package:qubit_ov/shared/ui/home/home.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  final Rx<XFile?> pickedImage = Rx<XFile?>(null);
  final Rx<File?> fileImage = Rx<File?>(null);
  final Rxn<Uint8List> selectedImagen = Rxn<Uint8List>();

  final uid = ''.obs;
  final email = ''.obs;
  final name = ''.obs;
  final lastName = ''.obs;
  final phoneNumber = ''.obs;
  final photoURL = ''.obs;
  final initials = ''.obs;

  final emailController = TextEditingController(text: 'gfalav@yahoo.com');
  final passwordController = TextEditingController(text: 'Pppp1#');
  final repasswordController = TextEditingController(text: 'Pppp1#');
  final nameController = TextEditingController(text: 'Gustavo');
  final lastNameController = TextEditingController(text: 'Falavigna');
  final phoneNumberController = TextEditingController(text: '+5492664512644');

  final passwordObscure = true.obs;
  final repasswordObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
    auth.authStateChanges().listen((User? user) {
      setUser(user);
    });
    ever(uid, (callback) => isLoggedIn());
  }

  Future<void> setUser(User? user) async {
    if (user == null) {
      setUserNull();
    } else if (!user.emailVerified) {
      setUserNull();
      auth.signOut();
      Get.snackbar(
        'EmailNotVerified',
        'Please verify your email before signing in.',
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      setUserData(user);
    }
  }

  void setUserNull() {
    uid.value = '';
    email.value = '';
    name.value = '';
    lastName.value = '';
    phoneNumber.value = '';
    photoURL.value = '';
    initials.value = '';
  }

  Future<void> setUserData(User user) async {
    await db.collection("userdata").doc(user.uid).get().then((
      DocumentSnapshot doc,
    ) {
      if (doc.data() != null) {
        final data = doc.data() as Map<String, dynamic>;
        name.value = data['name'];
        lastName.value = data['lastName'];
        phoneNumber.value = data['phoneNumber'];
        photoURL.value = data['photoURL'];
        initials.value = name.value[0] + lastName.value[0];
      }
    });
    uid.value = user.uid;
    email.value = user.email != null ? user.email! : '';
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
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await auth.currentUser!.sendEmailVerification();
      await auth.signOut();
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
      await auth.signInWithEmailAndPassword(
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
    await auth.signOut();
  }

  Future<void> updatePassword() async {
    try {
      await auth.currentUser!.updatePassword(passwordController.text);
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
      await auth.sendPasswordResetEmail(email: emailController.text);
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

  Future<void> userDataSave() async {
    try {
      if (pickedImage.value != null) {
        final strRef = storage.ref();
        final imageRef = strRef.child(
          "/userdata/${uid.value}.${pickedImage.value!.name.split(".").last}",
        );
        await imageRef.putData(selectedImagen.value!);
        photoURL.value = await imageRef.getDownloadURL();
        selectedImagen.value = null;
      }
      final user = <String, String>{
        "name": nameController.text,
        "lastName": lastNameController.text,
        "phoneNumber": phoneNumberController.text,
        "photoURL": photoURL.value,
      };
      await db.collection("userdata").doc(uid.value).set(user);
      await setUser(auth.currentUser);
      Get.offAll(Home());
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Sign Up Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    pickedImage.value = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage.value == null) {
      return;
    }
    selectedImagen.value = await pickedImage.value!.readAsBytes();
  }

  void setPasswordObscure() {
    passwordObscure.value = !passwordObscure.value;
  }

  void setRepasswordObscure() {
    repasswordObscure.value = !repasswordObscure.value;
  }
}
