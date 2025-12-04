import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/controllers/auth_controller.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Obx(
      () => CircleAvatar(
        radius: 16,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        backgroundImage: authController.photoURL.value != ''
            ? Image.network(authController.photoURL.value).image
            : null,
        child: authController.photoURL.value == ''
            ? Text(
                authController.initials.value,
                style: TextStyle(color: Colors.white),
              )
            : null,
      ),
    );
  }
}
