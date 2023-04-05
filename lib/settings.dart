
import 'package:flutter/material.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, 
          color: Colors.lightBlue,),
        ),
        title: Text('Settings', style: TextStyle(color: Colors.black),),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            child: Text('Pilihan 1'),
            value: 1,
          ),
          PopupMenuItem(
            child: Text('Pilihan 2'),
            value: 2,
          ),
          PopupMenuItem(
            child: Text('Pilihan 3'),
            value: 3,
          ),
            ],
            icon: Icon(
              Icons.more_vert,
              color: Colors.lightBlue, // mengubah warna titik tiga menjadi hitam
            ),
            onSelected: (value) {
              // melakukan sesuatu setelah memilih opsi dari menu
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.lightBlue,
                ),
                SizedBox(width: 8,),
                Text(
                  'Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/03/29/03/14/portrait-1287421_960_720.jpg"),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Faried Yoga Prawira',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Lihat Profil',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.lightBlue,
                ),
                SizedBox(width: 8,),
                Text(
                  'General',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 10,),
            buildAccountOptionRow(context, "Notifications"),
            buildAccountOptionRow(context, "Cards"),
            buildAccountOptionRow(context, "About"),
            buildAccountOptionRow(context, "Log Out"),
            SizedBox(height: 50,),
            
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(title),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Option 1"),
                        Text("Option 2"),
                        Text("Option 3")
                      ],
                    ),
                    actions: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close", style: TextStyle(color: Colors.black),),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  );
                }
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          );
  }
}