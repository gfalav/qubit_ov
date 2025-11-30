import 'package:flutter/material.dart';
import 'package:qubit_ov/shared/ui/auth/forms/change_password_form.dart';
import 'package:qubit_ov/shared/ui/pixabay/pixabay.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_scaffold.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return QubitScaffold(
      leftPanel: Center(child: Text("LeftPanel")),
      rightPanel: Pixabay(),
      drawerPanel: Center(child: Text("DrawerPanel")),
      bottomPanel: Center(child: Text("BottomPanel")),
      appBarTitle: "Change Password",
      appBarIcon: Icons.lock_reset.codePoint,
      showAppBarActions: true,
      leftWidth: 0,
      rightWidth: 40,
      mainWidth: 60,
      showLeftPanel: false,
      showRightPanel: true,
      showBottomPanel: false,
      mainPanel: ChangePasswordForm(),
    );
  }
}
