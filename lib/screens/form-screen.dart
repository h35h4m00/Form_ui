import 'package:flutter/material.dart';
import '../utilities/app-strings.dart';
import '../utilities/app-colors.dart';
import '../utilities/app-constants.dart';
import '../widgets/custom-textfield.dart';
import 'home-screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _key = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: AppColors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.padding),
        child: Form(
          key: _key,
          child: Column(
            children: [

              CustomTextField(
                hint: AppStrings.fullName,
                icon: Icons.person,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              CustomTextField(
                hint: AppStrings.email,
                icon: Icons.email,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email required";
                  }
                  if (!value.contains("@")) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              CustomTextField(
                hint: AppStrings.password,
                icon: Icons.lock,
                isPassword: true,
                controller: _passController,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Minimum 6 characters";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              CustomTextField(
                hint: AppStrings.phone,
                icon: Icons.phone,
                controller: _phoneController,
                validator: (value) {
                  if (value == null || value.length < 9) {
                    return "Invalid phone number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Form Submitted")),

                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius),
                    ),
                  ),
                  child: const Text(
                    AppStrings.submit,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}