import 'package:blog_app/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'admin.dart';

class AddProfileScreen extends StatefulWidget {
  final int id;
  final String username;
  final String status;

  AddProfileScreen({required this.id, required this.username, required this.status});

  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> addProfile() async {
    final url = Uri.parse('http://172.31.7.38/login/biodata.php');

    final response = await http.post(
      url,
      body: {
        'user_id': widget.id.toString(),
        'name': nameController.text,
        'email': emailController.text,
        'address': addressController.text,
        'phone': phoneController.text,
      },
    );

    if (response.statusCode == 200) {
      // Jika request berhasil, lakukan sesuatu (misalnya tampilkan pesan sukses)
      print('Profile added successfully');
      if (widget.status == "dokter") {
      Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Admin(id: widget.id, username: widget.username, status: widget.status,),
            ),
          );
      } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => User(id: widget.id, username: widget.username, status: widget.status,),
            ),
          );
        }
    } else {
      // Jika request gagal, lakukan sesuatu (misalnya tampilkan pesan error)
      print('Failed to add profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: addProfile,
              child: Text('Add Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
