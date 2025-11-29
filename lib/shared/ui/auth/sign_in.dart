import 'package:flutter/material.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_scaffold.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return QubitScaffold(
      leftPanel: Center(child: Text("LeftPanel")),
      rightPanel: Center(child: Text("RightPanel")),
      mainPanel: Center(child: Text("MainPanel")),
      drawerPanel: Center(child: Text("DrawerPanel")),
      bottomPanel: Center(child: Text("BottomPanel")),
      appBarTitle: "Sign In",
      appBarIcon: Icons.home.codePoint,
      showAppBarActions: true,
      leftWidth: 30,
      rightWidth: 30,
      mainWidth: 40,
      showLeftPanel: true,
      showRightPanel: true,
    );
  }
}