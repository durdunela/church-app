import 'package:church_application/Data/services/config.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<void> registerUser(String email, String password, String fullName,
      String verificationCode) async {
    return await apiService.registerUser(
        email, password, fullName, verificationCode);
  }

  Future<void> signInUser(String email, String password) async {
    return await apiService.signInUser(email, password);
  }
}
