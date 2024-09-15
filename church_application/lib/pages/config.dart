import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Use your machine's local IP address here
  final String baseUrl = 'http://192.168.1.28:3000';

  final String registrationEndpoint = '/registration';
  final String signInEndpoint = '/signin';

  Future<void> registerUser(
      String email, String password, String fullName) async {
    final url = Uri.parse(baseUrl + registrationEndpoint);
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
      print('Failed to register user: ${response.body}');
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
