import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/theme_notifier.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/ui/home/pages/profile_edit_page.dart';
import 'package:myapp/ui/widgets/confirmation_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String _userName = 'User Name';
  String _profilePicture = '';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'User Name';
      _profilePicture = prefs.getString('profileImage') ?? '';
    });
  }

  Future<void> _showConfirmationDialog() async {
    final result = await Get.dialog<bool>(
      const ConfirmationDialog(
        title: 'Are you sure you want to log out?',
      ),
    );

    if (result == true) {
      final authService = Get.find<AuthService>();
      await authService.logout();
    }
  }

  Future<void> _editProfile() async {
    final result = await Get.to(
      () => ProfileEditPage(
        currentName: _userName,
        currentProfilePicture: _profilePicture,
      ),
    );

    if (result != null && result is Map) {
      setState(() {
        _userName = result['name'] as String? ?? _userName;
        _profilePicture = result['profileImage'] as String? ?? '';
      });
      final prefs = await SharedPreferences.getInstance();
      if (result['profileImage'] == null) {
        await prefs.remove('profileImage');
      } else {
        await prefs.setString('profileImage', result['profileImage'] as String);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Get.find<ThemeNotifier>();
    final isDarkTheme = themeNotifier.themeMode == ThemeMode.dark;
    final theme = Theme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_userName, style: const TextStyle()),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundImage: _profilePicture.isNotEmpty &&
                        File(_profilePicture).existsSync()
                    ? FileImage(File(_profilePicture))
                    : null,
                radius: 10,
                child: _profilePicture.isEmpty ||
                        !File(_profilePicture).existsSync()
                    ? const Icon(Icons.person, size: 40)
                    : null,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'List',
                    onTap: () => Get.to(() => const PlaceholderScreen()),
                    theme: theme,
                  ),
                  const Divider(),
                  _buildCustomListTile(
                    title: isDarkTheme ? 'Light Mode' : 'Dark Mode',
                    onTap: themeNotifier.toggleTheme,
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'Edit Profile',
                    onTap: _editProfile,
                    theme: theme,
                  ),
                  _buildCustomListTile(
                    title: 'Logout',
                    onTap: _showConfirmationDialog,
                    theme: theme,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomListTile({
    required String title,
    required VoidCallback onTap,
    required ThemeData theme,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: theme.colorScheme.onSurface.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      height: 35,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, this.title = 'Placeholder Screen'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('This is a placeholder screen'),
      ),
    );
  }
}
