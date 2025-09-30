import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/ui/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'Welcome to the app!',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          _usernameField(),
          _passwordField(),
          _loginButton(context)
        ],
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF3C3B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF3C3B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF3C3B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF3C3B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String message = "";
          if (username == "rake" && password == "107") {
            setState(() {
              message = "Login berhasil!";
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage(username: username);
            }));
          } else if (username == "" || password == "") {
            setState(() {
              message = "Username atau Password tidak boleh kosong!";
            });
          } else {
            setState(() {
              message = "Login gagal";
            });
          }

          SnackBar messageBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(messageBar);
        },
        child: Text('Login'),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 55),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFEF3C3B)),
      ),
    );
  }
}
