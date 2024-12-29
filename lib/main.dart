import 'package:flutter/material.dart';
import 'views/landing_page.dart';
import 'views/admin_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page',
      // Define routes for navigation
      routes: {
        '/': (context) => const LandingPage(),
        '/admin': (context) => const AdminPage(),
      },
      initialRoute: '/admin', // Start with Landing Page
    );
  }
}
