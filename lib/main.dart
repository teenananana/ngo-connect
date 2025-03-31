import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart'; // Ensure you have firebase_options.dart configured
import 'package:demo/screens/home_page.dart';
import 'package:demo/screens/sign_up_page.dart';
import 'package:demo/screens/join_team_page.dart';
import 'package:demo/screens/opportunities_page.dart';
import 'package:demo/screens/rewards_page.dart';
import 'package:demo/screens/track_hours_page.dart'; 
import 'package:demo/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Load Firebase options
  );
  
  runApp(const NGOConnectApp());
}

class NGOConnectApp extends StatelessWidget {
  const NGOConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NGO Connect',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AuthWrapper(), // Check authentication state before navigating
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignUpPage(),
        '/join_team': (context) => const JoinTeamPage(),
        '/opportunities': (context) =>  OpportunitiesPage(),
        '/rewards': (context) =>  RewardsPage(),
        '/track_hours': (context) => const TrackHoursPage(),
      },
    );
  }
}

/// **Authentication Wrapper: Checks Firebase authentication status**
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()), // Show loading while checking auth
          );
        }
        if (snapshot.hasData) {
          return const HomePage(); // If user is logged in, go to HomePage
        }
        return const LoginPage(); // Otherwise, go to LoginPage
      },
    );
  }
}
