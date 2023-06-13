import 'dart:ui';

import 'package:blog_app/description_page.dart';
import 'package:blog_app/editAccount.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/profile.dart';
import 'package:blog_app/settings.dart';
import 'package:blog_app/widgets/about/about.dart';
import 'package:blog_app/widgets/list_pasien/tambah_pasien/DataTable.dart';
import 'package:blog_app/widgets/list_pasien/tambah_pasien/insert_pasien.dart';
import 'package:blog_app/widgets/list_pasien/list_view_pasien.dart';
import 'package:blog_app/widgets/list_pasien/tambah_pasien/table.dart';
import 'package:blog_app/widgets/list_view/list_view_activity.dart';
import 'package:blog_app/widgets/list_view/item_list.dart';
import 'package:blog_app/widgets/list_view/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 6, 67, 117)),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 174, 201, 223)),
                child: ListTile(
                  title: Text(
                    "Giku Apps",
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 121, 221),
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: const Text(
                  "Dashboard",
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return ProfilePage();
                    }),
                  );
                },
                leading: const Icon(Icons.account_circle),
                title: const Text(
                  "Akun",
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return const About();
                    }),
                  );
                },
                leading: const Icon(Icons.menu_book_rounded),
                title: const Text(
                  "Tentang",
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(builder: (context) {
              //         return DataTablePage();
              //       }),
              //     );
              //   },
              //   leading: const Icon(Icons.person_search_outlined),
              //   title: const Text(
              //     "Pasien Anda",
              //   ),
              // ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return ViewJson();
                    }),
                  );
                },
                leading: const Icon(Icons.personal_injury_outlined),
                title: const Text(
                  "Antrian",
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(builder: (context) {
              //         return ViewJson();
              //       }),
              //     );
              //   },
              //   leading: const Icon(Icons.book),
              //   title: const Text(
              //     "Data Antrian",
              //   ),
              // ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return const settingsPage();
                    }),
                  );
                },
                leading: const Icon(Icons.settings),
                title: const Text(
                  "Pengaturan",
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }),
                  );
                },
                leading: const Icon(Icons.logout),
                title: const Text(
                  "Logout",
                ),
              ),
            ],
          ),
        ),
      ),
      body: antrian(),
    );
  }
}

class antrian extends StatelessWidget {
  const antrian({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 67, 117),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Pasien'),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
