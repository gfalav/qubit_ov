import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:qubit_ov/shared/controllers/userdata_controller.dart';
import 'package:qubit_ov/shared/ui/logos/enterprise_logo.dart';

class UserdataForm extends StatelessWidget {
  const UserdataForm({super.key});

  @override
  Widget build(BuildContext context) {
    final UserdataController userdataController = Get.put(UserdataController());
    final formKey = GlobalKey<FormState>();

    void sendUserdataSave() {
      if (formKey.currentState?.validate() ?? false) {
        userdataController.userdataSave();
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
                  "Actualizar Información del Usuario",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: TextFormField(
                  controller: userdataController.nameController,
                  decoration: const InputDecoration(labelText: 'Nombres'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.firstName(),
                  ]),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: TextFormField(
                  controller: userdataController.lastNameController,
                  decoration: const InputDecoration(labelText: 'Apellidos'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.lastName(),
                  ]),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: TextFormField(
                  controller: userdataController.phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.phoneNumber(),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: ElevatedButton.icon(
                        onPressed: userdataController.pickImage,
                        label: const Text('Selecciona Imagen'),
                        icon: Icon(Icons.photo),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: userdataController.selectedImagen.value != null
                          ? Image.memory(
                              userdataController.selectedImagen.value!,
                              width: 150,
                              height: 150,
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      child: ElevatedButton.icon(
                        onPressed: sendUserdataSave,
                        label: const Text('Actualiza'),
                        icon: Icon(Icons.person),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      child: ElevatedButton.icon(
                        onPressed: Get.back,
                        label: const Text('Cancela'),
                        icon: Icon(Icons.cancel),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
