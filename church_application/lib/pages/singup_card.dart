import 'package:church_application/pages/config.dart';
import 'package:church_application/pages/home_page.dart';
import 'package:church_application/widgets/custom_elevatedbutton.dart';
import 'package:church_application/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignupCard extends StatefulWidget {
  const SignupCard({super.key});

  @override
  State<SignupCard> createState() => _SignupCardState();
}

class _SignupCardState extends State<SignupCard> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  final ApiService apiService = ApiService();

  Future<void> _signUp() async {
    final phone = phoneController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    final fullName = fullNameController.text.trim();

    if (!_validateInput(phone, password, confirmPassword, fullName)) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await apiService.registerUser(phone, password, fullName);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-up successful!')),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool _validateInput(
      String phone, String password, String confirmPassword, String fullName) {
    if (fullName.isEmpty) {
      setState(() {
        errorMessage = 'Please enter your full name.';
      });
      return false;
    }
    if (phone.isEmpty || !_isValidPhoneNumber(phone)) {
      // Validate phone number
      setState(() {
        errorMessage = 'Please enter a valid phone number.';
      });
      return false;
    }
    if (password.isEmpty || password.length < 6) {
      setState(() {
        errorMessage = 'Password must be at least 6 characters long.';
      });
      return false;
    }
    if (password != confirmPassword) {
      setState(() {
        errorMessage = 'Passwords do not match.';
      });
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  bool _isValidPhoneNumber(String phone) {
    final regex =
        RegExp(r'^\d{9}$'); // Example: Validates 10-digit phone numbers
    return regex.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: EdgeInsets.all(20.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 15),
              CustomRoundedTextField(
                controller: fullNameController,
                hintText: 'მომხმარებლის სახელი/გვარი',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              const SizedBox(height: 15),
              CustomRoundedTextField(
                hintText: 'ტელეფონის ნომერი',
                controller: phoneController,
                prefixIcon: Icon(Icons.phone),
              ),
              const SizedBox(height: 15),
              CustomRoundedTextField(
                controller: passwordController,
                hintText: 'პაროლი',
                prefixIcon: Icon(Icons.lock),
              ),
              const SizedBox(height: 16),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (isLoading)
                const CircularProgressIndicator()
              else
                const SizedBox(height: 20),
              CustomButton(
                backgroundColor: Color(0xFFAA925C),
                onPressed: _signUp,
                text: 'ანგარიშის შექმნა',
              )
            ],
          ),
        ),
      ),
    );
  }
}
