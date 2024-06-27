import 'package:flutter/material.dart';
import 'package:myapp/ui/home/custom_drawer.dart'; // CustomDrawer dosya yolunu doğru şekilde güncellediğinizden emin olun

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: const CustomDrawer(), // CustomDrawer'ı buraya ekliyoruz
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
