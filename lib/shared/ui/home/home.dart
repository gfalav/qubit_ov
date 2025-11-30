import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/controllers/auth_controller.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    void onPressed() {
      authController.uid.value = '';
      // Log out action
    }

    return QubitScaffold(
      leftPanel: Center(child: Text("LeftPanel")),
      rightPanel: Center(child: Text("RightPanel")),
      mainPanel: Center(
        child: ElevatedButton(onPressed: onPressed, child: Text("LogOut")),
      ),
      drawerPanel: Center(child: Text("DrawerPanel")),
      bottomPanel: Center(child: Text("BottomPanel")),
      appBarTitle: "Home",
      appBarIcon: Icons.home.codePoint,
      showAppBarActions: true,
      leftWidth: 30,
      rightWidth: 30,
      mainWidth: 40,
      showLeftPanel: true,
      showRightPanel: true,
      showBottomPanel: true,
    );
  }
}
