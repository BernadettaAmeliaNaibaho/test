import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userCtrl = TextEditingController();

  Future<void> _login() async {
    final username = _userCtrl.text.trim();
    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Masukkan username')));
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _userCtrl, decoration: InputDecoration(labelText: 'Username')),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
