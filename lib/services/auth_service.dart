import 'package:flutter/material.dart';
import '../screens/login_page.dart';
// import 'auth_service.dart'; // Remove this if it's unnecessary

// Define the AuthService class if it doesn't exist
class AuthService {
  Future<void> signOut() async {
    // Simulate sign-out logic
    print('User signed out');
  }
}

class LogoutService {
  final AuthService _authService = AuthService();

  Future<void> logout(BuildContext context) async {
    try {
      await _authService.signOut();

      // Navigate to login page and remove all routes
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error logging out: ${e.toString()}')),
        );
      }
    }
  }
}
