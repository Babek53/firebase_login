import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/ui/widgets/custom_button.dart';
import 'package:myapp/ui/widgets/custom_form_field.dart';
import 'package:myapp/utils/validators.dart';

class RecoverPasswordPage extends StatelessWidget {
  RecoverPasswordPage({super.key});

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: Get.back),
        title: const Text('Recover Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Don’t worry! It happens to the best of us!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Form(
                child: Column(
                  children: [
                    CustomFormField(
                      controller: controller.emailController,
                      filled: true,
                      labelText: 'Email',
                      validator: Validator.emailValidator,
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => SizedBox(
                        height: 48,
                        child: CustomButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  controller.resetPassword(
                                    email: controller.email,
                                  );
                                },
                          child: controller.isLoading.value
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(),
                                )
                              : const Text('Send Recovery Link'),
                        ),
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
