import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/controllers/auth_controller.dart';
import 'package:qubit_ov/shared/ui/auth/change_password.dart';
import 'package:qubit_ov/shared/ui/auth/user_avatar.dart';
import 'package:qubit_ov/shared/ui/home/home.dart';
import 'package:qubit_ov/shared/ui/userdata/userdata.dart';

class UserActions extends StatelessWidget {
  const UserActions({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return PopupMenuButton(
      child: UserAvatar(),
      itemBuilder: (itemBuilder) => [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Perfil de Usuario"),
            onTap: () async {
              await Get.to(Userdata());
              Get.offAll(Home());
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.key),
            title: const Text("Cambia Password"),
            onTap: () async {
              await Get.to(ChangePassword());
              Get.offAll(Home());
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Cierra Sesión"),
            onTap: () {
              authController.signOut();
            },
          ),
        ),
      ],
    );
  }
}
