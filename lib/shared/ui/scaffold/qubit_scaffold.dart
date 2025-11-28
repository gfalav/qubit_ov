import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/controllers/app_controller.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_appbar.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_body.dart';
import 'package:qubit_ov/shared/ui/scaffold/qubit_drawer.dart';

class QubitScaffold extends StatelessWidget {
  final Widget leftPanel;
  final Widget rightPanel;
  final Widget mainPanel;
  final Widget? bottomPanel;
  final String appBarTitle;
  final int appBarIcon;
  final Widget drawerPanel;
  final bool showAppBarActions;
  final double leftWidth;
  final double rightWidth;
  final double mainWidth;
  final bool showLeftPanel;
  final bool showRightPanel;
  const QubitScaffold({
    super.key,
    required this.leftPanel,
    required this.rightPanel,
    required this.mainPanel,
    required this.bottomPanel,
    required this.appBarTitle,
    required this.appBarIcon,
    required this.drawerPanel,
    required this.showAppBarActions,
    required this.leftWidth,
    required this.rightWidth,
    required this.mainWidth,
    required this.showLeftPanel,
    required this.showRightPanel,
  });

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.put(AppController());
    appController.updateScreenSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    return Scaffold(
      appBar: QubitAppbar().appBar(
        context,
        appBarTitle,
        appBarIcon,
        showAppBarActions,
      ),
      body: QubitBody(
        leftPanel: leftPanel,
        rightPanel: rightPanel,
        mainPanel: mainPanel,
        bottomPanel: bottomPanel,
        leftWidth: leftWidth,
        rightWidth: rightWidth,
        mainWidth: mainWidth,
        showLeftPanel: showLeftPanel,
        showRightPanel: showRightPanel,
      ),
      drawer: appController.devType.value == 'Mobile' ? QubitDrawer() : null,
    );
  }
}
