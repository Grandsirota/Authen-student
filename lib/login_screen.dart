import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'signup_screen.dart';
import 'reset_password_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final user = await AuthService().signInWithEmailAndPassword(
      emailController.text,
      passwordController.text,
      context,
    );
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void navigateToResetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;
    double maxWidth = 400;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade300, Colors.purple.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: width < maxWidth ? width : maxWidth,
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App Logo or Icon
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.purple.shade100,
                    child: Icon(
                      Icons.lock,
                      size: 40,
                      color: Colors.purple.shade700,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Title
                  Text(
                    "เข้าสู่ระบบ",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade800,
                    ),
                  ),
                  SizedBox(height: 24),

                  // Email Input Field
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "อีเมล",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.purple.shade700,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Password Input Field
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "รหัสผ่าน",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.purple.shade700,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24),

                  // Login Button
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 16),

                  // Sign Up and Reset Password Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: navigateToSignUp,
                        child: Text(
                          "สร้างบัญชีใหม่",
                          style: TextStyle(
                            color: Colors.purple.shade700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: navigateToResetPassword,
                        child: Text(
                          "ลืมรหัสผ่าน?",
                          style: TextStyle(
                            color: Colors.purple.shade700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
