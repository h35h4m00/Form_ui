import 'package:flutter/material.dart';
import '../utilities/app-colors.dart';
import '../utilities/app-strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const Center(
        child: Text(
          AppStrings.settingsMessage,
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}