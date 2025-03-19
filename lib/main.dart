// Importing necessary Flutter and Firebase packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Firebase configuration options
import 'login_screen.dart'; // Login screen widget

// Main function: Entry point of the Flutter application
void main() async {
  // Ensures Flutter bindings are initialized before Firebase setup
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Run the main application widget
  runApp(MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      title: 'Flutter Firebase Auth', // Application title
      theme: ThemeData(
        // Define the app's theme with a custom color scheme
        primarySwatch: Colors.green, // Use a predefined MaterialColor
        visualDensity: VisualDensity.adaptivePlatformDensity, // Adaptive UI
      ),
      home: LoginScreen(), // Set the initial screen to LoginScreen
    );
  }
}
