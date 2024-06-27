import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/theme_notifier.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/themes/custom_dark_theme.dart';
import 'package:myapp/themes/custom_light_theme.dart';
import 'package:myapp/ui/auth/login_page.dart';
import 'package:myapp/ui/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthService());
  final themeNotifier = Get.put(ThemeNotifier());
  await themeNotifier.loadThemePreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeNotifier = Get.find<ThemeNotifier>();
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomLightTheme().themeData,
        darkTheme: CustomDarkTheme().themeData,
        themeMode: themeNotifier.themeMode,
        home: const Root(),
        getPages: [
          GetPage(name: '/home', page: () => const HomeScreen()),
          GetPage(name: '/login', page: LoginPage.new),
        ],
        initialBinding: BindingsBuilder(() {
          Get.put(AuthController());
        }),
      );
    });
  }
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();

    return Obx(() {
      if (authService.user != null) {
        return const HomeScreen();
      } else {
        return LoginPage();
      }
    });
  }
}
