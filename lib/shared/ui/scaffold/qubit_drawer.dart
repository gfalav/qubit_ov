import 'package:flutter/material.dart';
import 'package:qubit_ov/shared/ui/menu/menu.dart';

class QubitDrawer extends StatelessWidget {
  const QubitDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Menu());
  }
}
