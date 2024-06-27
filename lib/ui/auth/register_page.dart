import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/ui/widgets/custom_button.dart';
import 'package:myapp/ui/widgets/custom_form_field.dart';
import 'package:myapp/ui/widgets/custom_icon_button.dart';
import 'package:myapp/utils/validators.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Please register to access the app.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 32),
                      CustomFormField(
                        controller: controller.fullNameController,
                        labelText: 'Full Name',
                        validator: Validator.nameValidator,
                      ),
                      const SizedBox(height: 8),
                      CustomFormField(
                        controller: controller.emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.emailValidator,
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => CustomFormField(
                          controller: controller.passwordController,
                          labelText: 'Password',
                          obscureText: controller.isPasswordHidden.value,
                          suffixIcon: GestureDetector(
                            onTap: controller.togglePasswordVisibility,
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          validator: Validator.passwordValidator,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => CustomButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.authenticateWithEmailAndPassword,
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Text('Create Account'),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomIconButtonOutlined(
                            icon: Icons.login,
                            onPressed: controller.authenticateWithGoogle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          style: theme.textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed('/login'),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
