import 'dart:ui';

import 'package:blog_app/description_page.dart';
import 'package:blog_app/editAccount.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/profile.dart';
import 'package:blog_app/settings.dart';
import 'package:blog_app/widgets/about/about.dart';
import 'package:blog_app/widgets/list_pasien/list_view_pasien.dart';
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
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return ListViewActivity();
                    }),
                  );
                },
                leading: const Icon(Icons.person_search_outlined),
                title: const Text(
                  "Data Dokter",
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return Pasien();
                    }),
                  );
                },
                leading: const Icon(Icons.personal_injury_outlined),
                title: const Text(
                  "Data Pasien",
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return antrian();
                    }),
                  );
                },
                leading: const Icon(Icons.book),
                title: const Text(
                  "Data Antrian",
                ),
              ),
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
            padding: EdgeInsets.all(5),
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
                  child: const Text('03 Maret 2023'),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 67, 117),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('04 Maret 2023'),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 67, 117),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('05 Maret 2023'),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 67, 117),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('06 Maret 2023'),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DescriptionPage(
                      title: "Dr. Andita Setianingrum",
                      image: "images/32.png",
                    );
                  },
                ),
              );
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset('images/32.png'),
                  const ListTile(
                    title: Text("Detail Antrian"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DescriptionPage(
                      title: "Dr. Widya Astuti",
                      image: "images/33.png",
                    );
                  },
                ),
              );
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset('images/33.png'),
                  const ListTile(
                    title: Text("Detail Antrian"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DescriptionPage(
                      title: "Dr. Cahyodi TR",
                      image: "images/34.png",
                    );
                  },
                ),
              );
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset("images/34.png"),
                  const ListTile(
                    title: Text("Detail Antrian"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DescriptionPage(
                      title: "Dr. Wudiyansyah",
                      image: "images/35.png",
                    );
                  },
                ),
              );
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset("images/35.png"),
                  const ListTile(
                    title: Text("Detail Antrian"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
