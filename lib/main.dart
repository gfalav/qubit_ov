import 'package:firebase_core/firebase_core.dart';
import 'package:qubit_ov/shared/controllers/auth_controller.dart';
import 'package:qubit_ov/shared/ui/home/home.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/ui/theme/theme.dart';
import 'package:qubit_ov/shared/ui/theme/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(
      context,
      "Open Sans Condensed",
      "Roboto",
    );

    MaterialTheme theme = MaterialTheme(textTheme);
    return GetMaterialApp(
      title: 'Qubit OV',
      debugShowCheckedModeBanner: false,
      onReady: () => authController.isLoggedIn(),
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const Home(),
    );
  }
}
