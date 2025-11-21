import 'package:flutter/material.dart';
import '../utilities/app-colors.dart';
import '../utilities/app-strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const Center(
        child: Text(
          AppStrings.profileMessage,
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}