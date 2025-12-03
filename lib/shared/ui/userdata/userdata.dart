import 'package:flutter/material.dart';
import 'package:qubit_ov/shared/ui/pixabay/pixabay.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_scaffold.dart';
import 'package:qubit_ov/shared/ui/userdata/userdata_form.dart';

class Userdata extends StatelessWidget {
  const Userdata({super.key});

  @override
  Widget build(BuildContext context) {
    return QubitScaffold(
      leftPanel: Center(child: Text("LeftPanel")),
      rightPanel: Pixabay(),
      drawerPanel: Center(child: Text("DrawerPanel")),
      bottomPanel: Center(child: Text("BottomPanel")),
      appBarTitle: "Datos de Usuario",
      appBarIcon: Icons.person.codePoint,
      showAppBarActions: true,
      leftWidth: 0,
      rightWidth: 40,
      mainWidth: 60,
      showLeftPanel: false,
      showRightPanel: true,
      showBottomPanel: false,
      mainPanel: UserdataForm(),
    );
  }
}
