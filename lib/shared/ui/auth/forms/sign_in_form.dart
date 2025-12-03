import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/controllers/auth_controller.dart';
import 'package:qubit_ov/shared/ui/auth/reset_password.dart';
import 'package:qubit_ov/shared/ui/auth/sign_up.dart';
import 'package:qubit_ov/shared/ui/logos/enterprise_logo.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();

    void sendSignIn() {
      if (formKey.currentState?.validate() ?? false) {
        authController.signIn();
      }
    }

    return Obx(
      () => Padding(
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
                  "Bienvenido a Edesal App",
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
              Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: TextFormField(
                  controller: authController.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffix: IconButton(
                      onPressed: () => authController.setPasswordObscure(),
                      icon: Icon(Icons.lock, size: 20),
                    ),
                  ),
                  obscureText: authController.passwordObscure.value,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.password(
                      minLength: 6,
                      maxLength: 32,
                      minLowercaseCount: 1,
                      minUppercaseCount: 1,
                      minNumberCount: 1,
                      minSpecialCharCount: 1,
                      checkNullOrEmpty: true,
                      errorText:
                          "Debe contener 6 caracteres, al menos una letra mayúscula, una minúscula, un número y un carácter especial.",
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: ElevatedButton.icon(
                  onPressed: sendSignIn,
                  label: const Text('Ingresar'),
                  icon: Icon(Icons.login),
                ),
              ),
              TextButton(
                onPressed: () => Get.to(ResetPassword()),
                child: Text("Olvidé mi contraseña"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35, bottom: 16),
                child: Text("No tienes una cuenta? Regístrate aquí."),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: ElevatedButton(
                      onPressed: () => Get.to(SignUp()),
                      child: Icon(Icons.mail),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: ElevatedButton(
                      onPressed: () => Get.to(SignUp()),
                      child: Icon(FontAwesomeIcons.google),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: ElevatedButton(
                      onPressed: () => Get.to(SignUp()),
                      child: Icon(FontAwesomeIcons.facebook),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: ElevatedButton(
                      onPressed: () => Get.to(SignUp()),
                      child: Icon(FontAwesomeIcons.apple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
