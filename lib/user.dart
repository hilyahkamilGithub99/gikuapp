import 'package:flutter/material.dart';
import 'package:blog_app/login.dart';
import 'profiles.dart';
import 'profile_list.dart';

class User extends StatefulWidget {
  final int id;
  final String username;
  final String status;

  User({required this.username, required this.id, required this.status});

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("status : ${widget.status}"),
              SizedBox(height: 20),
              Text("Welcome : ${widget.username}"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text("Keluar"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AddProfileScreen(id: widget.id, username: widget.username, status: widget.status,)),
                  );
                },
                child: Text("tambahkan biodata"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileList(id: widget.id),
                    ),
                  );
                },
                child: Text("lihat biodata"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
