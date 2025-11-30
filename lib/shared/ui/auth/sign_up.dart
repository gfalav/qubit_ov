import 'package:flutter/material.dart';
import 'package:qubit_ov/shared/ui/auth/forms/sign_up_form.dart';
import 'package:qubit_ov/shared/ui/pixabay/pixabay.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_scaffold.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return QubitScaffold(
      leftPanel: Center(child: Text("LeftPanel")),
      rightPanel: Pixabay(),
      drawerPanel: Center(child: Text("DrawerPanel")),
      bottomPanel: Center(child: Text("BottomPanel")),
      appBarTitle: "Sign Up",
      appBarIcon: Icons.home.codePoint,
      showAppBarActions: true,
      leftWidth: 00,
      rightWidth: 40,
      mainWidth: 60,
      showLeftPanel: false,
      showRightPanel: true,
      showBottomPanel: false,
      mainPanel: SignUpForm(),
    );
  }
}
