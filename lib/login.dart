import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:blog_app/admin.dart';
import 'package:blog_app/user.dart';

import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';
  String status = '';

  String alert = "Ready for Login";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  void loginProcess() async {
    print("Login button pressed");
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse("http://172.31.6.91/login/login.php"),
        body: {
          "username": usernameInput.text,
          "password": passwordInput.text,
        },
      );

      var dataUser = json.decode(response.body);

      if (dataUser.length < 1) {
        setState(() {
          alert = "You can't login";
        });
      } else {
        setState(() {
          username = dataUser[0]["username"];
          password = dataUser[0]["password"];
          status = dataUser[0]["status"];
        });

        if (status == "admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Admin(username: username),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => User(username: username),
            ),
          );
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                height: 80,
                width: 80,
              ),
              Text(
                "Giku Apps",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightBlue,
                ),
              ),
              SizedBox(height: 24.0),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameInput,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                            size: 40,
                          ),
                          hintText: "Enter your username",
                          hintStyle: TextStyle(color: Colors.black87),
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.black87),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Username is empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordInput,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 40,
                          ),
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.black87),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black87),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Password is empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Card(
                        color: Colors.black87,
                        elevation: 5,
                        child: Container(
                          height: 50,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              loginProcess();
                            },
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.lightBlue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  SizedBox(width: 8.0),
                  Text('or'),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.lightBlue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
