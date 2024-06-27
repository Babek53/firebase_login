import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/utils/dialogs.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find();

  RxBool isRegisterMode = true.obs;
  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get fullName => fullNameController.text.trim();
  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();

  void toggleRegisterMode() {
    isRegisterMode.value = !isRegisterMode.value;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> authenticateWithEmailAndPassword() async {
    isLoading.value = true;
    try {
      if (isRegisterMode.value) {
        await _authService.register(
          fullName: fullName,
          email: email,
          password: password,
        );
        await showMessageDialog(
          message:
              'A verification email has been sent to the provided email address. Please verify your email to continue using the app.',
        );
        while (!_authService.isEmailVerified) {
          await Future.delayed(const Duration(seconds: 5));
          await _authService.user?.reload();
        }
      } else {
        await _authService.login(email: email, password: password);
      }
    } catch (e) {
      await showMessageDialog(
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> authenticateWithGoogle() async {
    isLoading.value = true;
    try {
      await _authService.signInWithGoogle();
      await Get.offAllNamed('/home');
    } catch (e) {
      await showMessageDialog(
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword({required String email}) async {
    isLoading.value = true;
    try {
      await _authService.resetPassword(email: email);
      await showMessageDialog(
        message:
            'A password reset link has been sent to $email. Please check your email to reset your password.',
      );
    } catch (e) {
      await showMessageDialog(
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
