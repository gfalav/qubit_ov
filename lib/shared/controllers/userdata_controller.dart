import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qubit_ov/shared/controllers/auth_controller.dart';
import 'package:qubit_ov/shared/ui/home/home.dart';

class UserdataController extends GetxController {
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  final AuthController authController = Get.put(AuthController());

  final name = ''.obs;
  final lastName = ''.obs;
  final phoneNumber = ''.obs;
  final photoURL = ''.obs;

  final Rx<XFile?> pickedImage = Rx<XFile?>(null);
  final Rx<File?> fileImage = Rx<File?>(null);
  final Rxn<Uint8List> selectedImagen = Rxn<Uint8List>();

  final nameController = TextEditingController(text: 'Gustavo');
  final lastNameController = TextEditingController(text: 'Falavigna');
  final phoneNumberController = TextEditingController(text: '+5492664512644');

  Future<void> userdataSave() async {
    try {
      if (pickedImage.value != null) {
        final strRef = storage.ref();
        final imageRef = strRef.child(
          "/userdata/${authController.uid.value}.${pickedImage.value!.name.split(".").last}",
        );
        await imageRef.putData(selectedImagen.value!);
        photoURL.value = await imageRef.getDownloadURL();
      }
      final user = <String, String>{
        "name": nameController.text,
        "lastName": lastNameController.text,
        "phoneNumber": phoneNumberController.text,
        "photoURL": photoURL.value,
      };
      await db.collection("userdata").doc(authController.uid.value).set(user);
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
}
