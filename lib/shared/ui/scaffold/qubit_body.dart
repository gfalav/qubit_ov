import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/controllers/app_controller.dart';

class QubitBody extends StatelessWidget {
  final Widget leftPanel;
  final Widget rightPanel;
  final Widget mainPanel;
  final Widget? bottomPanel;
  final double leftWidth;
  final double rightWidth;
  final double mainWidth;
  final bool showLeftPanel;
  final bool showRightPanel;
  final bool showBottomPanel;
  const QubitBody({
    super.key,
    required this.leftPanel,
    required this.rightPanel,
    required this.mainPanel,
    required this.bottomPanel,
    required this.leftWidth,
    required this.rightWidth,
    required this.mainWidth,
    required this.showLeftPanel,
    required this.showRightPanel,
    required this.showBottomPanel,
  });

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();

    return Obx(
      () => Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Visibility(
                  visible:
                      appController.devType.value != 'Mobile' && showLeftPanel,
                  child: Container(
                    width: appController.screenWidth * leftWidth / 100,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: leftPanel,
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: appController.screenHeight.value - 56,
                    ),
                    width: appController.devType.value != 'Mobile'
                        ? appController.screenWidth.value * mainWidth / 100
                        : appController.screenWidth.value,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: mainPanel,
                  ),
                ),
                Visibility(
                  visible:
                      appController.devType.value != 'Mobile' && showRightPanel,
                  child: Container(
                    width: appController.screenWidth * rightWidth / 100,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: rightPanel,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: showBottomPanel,
            child: Container(
              color: Theme.of(context).colorScheme.surfaceContainer,
              height: 48,
              child: bottomPanel,
            ),
          ),
        ],
      ),
    );
  }
}
