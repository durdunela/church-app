import 'package:church_application/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:church_application/pages/home_page.dart';
import 'package:church_application/widgets/custom_elevatedbutton.dart';
import 'package:church_application/widgets/custom_textfield.dart';
import 'config.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  final ApiService apiService = ApiService();

  Future<void> _signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    final fullName = fullNameController.text.trim();

    if (!_validateInput(email, password, confirmPassword, fullName)) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await apiService.registerUser(email, password, fullName);

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
      String email, String password, String confirmPassword, String fullName) {
    if (fullName.isEmpty) {
      setState(() {
        errorMessage = 'Please enter your full name.';
      });
      return false;
    }
    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        errorMessage = 'Please enter a valid email address.';
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
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            CustomRoundedTextField(
              controller: fullNameController,
              hintText: 'Full Name',
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 15),
            CustomRoundedTextField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 15),
            CustomRoundedTextField(
              controller: passwordController,
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              obscureText: true,
              isPassword: true,
            ),
            const SizedBox(height: 15),
            CustomRoundedTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              prefixIcon: const Icon(Icons.lock),
              obscureText: true,
              isPassword: true,
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
              backgroundColor: Colors.purpleAccent,
              onPressed: _signUp,
              text: 'Sign Up',
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: const Text(
                'Already have an account? Log In',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
