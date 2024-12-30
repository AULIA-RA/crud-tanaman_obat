import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  Future<void> _login(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    final usernameOrEmail = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (usernameOrEmail.isEmpty || password.isEmpty) {
      _showErrorDialog(context, "Please fill in all fields.");
    } else if ((usernameOrEmail == savedUsername || usernameOrEmail == savedEmail) && password == savedPassword) {
      Navigator.pushReplacementNamed(context, '/HomePage1');
    } else {
      _showErrorDialog(context, "Invalid credentials. Please try again.");
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Login Failed"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Animasi tanaman bergerak
          AnimatedPlant(), 
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Icon(Icons.lock_outline, size: 80, color: Colors.greenAccent),
                  SizedBox(height: 20),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text("Login to continue", style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(height: 30),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username or Email',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _login(context),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.greenAccent,
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/register'),
                    child: Text('Create Account', style: TextStyle(color: Colors.green)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedPlant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 20), 
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, double value, child) {
        return Positioned(
          top: 50 + value, 
          left: -50,
          child: Opacity(
            opacity: 0.2,
            child: Icon(
              Icons.local_florist_outlined,
              size: 300,
              color: const Color.fromARGB(255, 60, 179, 113),
            ),
          ),
        );
      },
      onEnd: () {
        // Animasi terus berulang
        Future.delayed(Duration.zero, () => build(context));
      },
    );
  }
}



