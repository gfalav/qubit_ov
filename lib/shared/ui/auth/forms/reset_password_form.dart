import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/controllers/auth_controller.dart';
import 'package:qubit_ov/shared/ui/logos/enterprise_logo.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();

    void sendResetPassword() {
      if (formKey.currentState?.validate() ?? false) {
        authController.sendPasswordResetEmail();
      }
    }

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EnterpriseLogo(),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 16),
              child: Text(
                "Recupera Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextFormField(
                controller: authController.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: ElevatedButton(
                      onPressed: sendResetPassword,
                      child: const Text('Envía Email'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: ElevatedButton(
                      onPressed: Get.back,
                      child: const Text('Cancela'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
