import 'package:flutter/material.dart';
import 'package:qubit_ov/shared/ui/auth/forms/sign_in_form.dart';
import 'package:qubit_ov/shared/ui/pixabay/pixabay.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_scaffold.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return QubitScaffold(
      leftPanel: Center(child: Text("LeftPanel")),
      rightPanel: Pixabay(),
      drawerPanel: Center(child: Text("DrawerPanel")),
      bottomPanel: Center(child: Text("BottomPanel")),
      appBarTitle: "Sign In",
      appBarIcon: Icons.login.codePoint,
      showAppBarActions: true,
      leftWidth: 0,
      rightWidth: 40,
      mainWidth: 60,
      showLeftPanel: false,
      showRightPanel: true,
      showBottomPanel: false,
      mainPanel: SignInForm(),
    );
  }
}
