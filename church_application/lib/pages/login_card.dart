import 'package:church_application/pages/config.dart';
import 'package:church_application/pages/home_page.dart';
import 'package:church_application/widgets/custom_elevatedbutton.dart';
import 'package:church_application/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  final VoidCallback onSwitchToSignUp;

  const LoginCard({super.key, required this.onSwitchToSignUp});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  final ApiService apiService = ApiService();

  Future<void> _signIn() async {
    final fullName = fullnameController.text.trim();
    final password = passwordController.text;

    if (!_validateInput(fullName, password)) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await apiService.signInUser(fullName, password);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('შესვლა წარმატებით დასრულდა!')),
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

  bool _validateInput(String fullName, String password) {
    if (fullName.isEmpty) {
      setState(() {
        errorMessage = 'გთხოვთ, შეიყვანოთ თქვენი სრული სახელი.';
      });
      return false;
    }
    if (password.isEmpty || password.length < 6) {
      setState(() {
        errorMessage = 'პაროლი უნდა იყოს მინიმუმ 6 სიმბოლო.';
      });
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    fullnameController.dispose();
    passwordController.dispose();
    super.dispose();
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
              CustomRoundedTextField(
                hintText: 'მომხმარებელი',
                controller: fullnameController,
                prefixIcon: Icon(Icons.alternate_email),
              ),
              const SizedBox(height: 15),
              CustomRoundedTextField(
                controller: passwordController,
                hintText: 'პაროლი',
                prefixIcon: Icon(Icons.lock),
                isPassword: true,
              ),
              const SizedBox(height: 15),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 16),
              if (isLoading)
                const CircularProgressIndicator()
              else
                const SizedBox(height: 10),
              CustomButton(
                backgroundColor: Color(0xFFAA925C),
                onPressed: _signIn,
                text: 'შესვლა',
              ),
              TextButton(
                onPressed: widget.onSwitchToSignUp,
                child: const Text(
                  "არ ხარ დარეგისტრირებული? შექმენი ანგარიში",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
