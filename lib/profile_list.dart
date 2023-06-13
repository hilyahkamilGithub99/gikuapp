import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileList extends StatefulWidget {
  final int id;
  
  ProfileList({required this.id});
  
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  List<dynamic> profiles = [];

  Future<void> fetchProfiles() async {
    final url = Uri.parse('http://172.31.7.38/login/get_profiles.php');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['success']) {
        final filteredProfiles = data['profiles']
            .where((profile) => profile['user_id'] == widget.id.toString())
            .toList();

        setState(() {
          profiles = filteredProfiles;
        });
      } else {
        print('Failed to fetch profiles: ${data['message']}');
      }
    } else {
      print('Failed to fetch profiles');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile List'),
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];

          return Column(
            children: [
              ListTile(
                title: Text('nama'),
                subtitle: Text(profile['name']),
              ),
              ListTile(
                title: Text('e-mail'),
                subtitle: Text(profile['email']),
              ),
              ListTile(
                title: Text('alamat'),
                subtitle: Text(profile['address']),
              ),
              ListTile(
                title: Text('no. telepon'),
                subtitle: Text(profile['phone']),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Keluar"),
              ),
            ],
          );
        },
      ),
    );
  }
}
