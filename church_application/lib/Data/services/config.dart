import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:3000';

  final String registrationEndpoint = '/registration';
  final String signInEndpoint = '/signin';

  Future<void> registerUser(String email, String password, String fullName,
      String verificationCode) async {
    final url = Uri.parse(baseUrl + registrationEndpoint);
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "fullName": fullName,
        }),
      );

      if (response.statusCode == 200) {
        print('User registered successfully');
      } else {
        print(
            'Failed to register user. Status code: ${response.statusCode}, Response: ${response.body}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  Future<void> signInUser(String email, String password) async {
    final url = Uri.parse(baseUrl + signInEndpoint);
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Sign-in successful: ${responseData}');
    } else {
      print('Failed to sign in: ${response.body}');
    }
  }
}
