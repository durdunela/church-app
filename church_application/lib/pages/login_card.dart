import 'package:church_application/pages/config.dart';
import 'package:church_application/pages/home_page.dart';
import 'package:church_application/pages/singup_card.dart';
import 'package:church_application/widgets/custom_elevatedbutton.dart';
import 'package:church_application/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

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
    final email = fullnameController.text.trim();
    final password = passwordController.text;

    if (!_validateInput(email, password)) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await apiService.signInUser(email, password);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-in successful!')),
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

  bool _validateInput(String email, String password) {
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
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            CustomRoundedTextField(
              controller: fullnameController,
              hintText: 'მომხმარებელი',
              prefixIcon: Icon(Icons.alternate_email),
            ),
            const SizedBox(height: 15),
            CustomRoundedTextField(
              hintText: 'პაროლი',
              controller: passwordController,
              prefixIcon: Icon(Icons.lock),
              obscureText: true,
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
            if (isLoading)
              const CircularProgressIndicator()
            else
              const SizedBox(height: 20),
            CustomButton(
              backgroundColor: Color(0xFFAA925C),
              onPressed: _signIn,
              text: 'შესვლა',
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Text(
                  'არ ხარ დარეგისტრირებული ჯერ?',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignupCard()));
                  },
                  child: Text(
                    'შექმენი ანგარიში',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
