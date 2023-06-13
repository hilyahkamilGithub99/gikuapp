import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:blog_app/login.dart';


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String username = '';
  String password = '';
  String selectedStatus = 'pasien'; // Default status: user
  String alert = "Ready for Signup";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  void signupProcess() async {
    print("Signup button pressed");
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse("http://172.31.7.38/login/signup.php"),
        body: {
          "username": usernameInput.text,
          "password": passwordInput.text,
          "status": selectedStatus, // Menggunakan selectedStatus sebagai status akun
        },
      );

      var data = json.decode(response.body);
      print(response.body);

      if (data['status'] == "success") {
        setState(() {
          alert = "Registration successful";
        });
        // Pindah ke halaman login setelah registrasi sukses
      Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
      } else {
        setState(() {
          alert = "Registration failed";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        color: Colors.lightBlue,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Registration",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
                SizedBox(height: 15),
                Text(
                  alert,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 15),
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
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          prefixIcon: Icon(
                            Icons.category,
                            size: 40,
                          ),
                          hintText: "Select your account type",
                          hintStyle: TextStyle(color: Colors.black87),
                          labelText: "Account Type",
                          labelStyle: TextStyle(color: Colors.black87),
                        ),
                        value: selectedStatus,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStatus = newValue!;
                          });
                        },
                        items: <String>['pasien', 'dokter']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                              signupProcess();
                            },
                            child: Center(
                              child: Text(
                                "Signup",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
