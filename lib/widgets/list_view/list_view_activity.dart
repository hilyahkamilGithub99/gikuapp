import 'package:blog_app/home_page.dart';
import 'package:flutter/material.dart';

import './item_list.dart';
import './user_model.dart';

class ListViewActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListViewActivityState();
}

class ListViewActivityState extends State<ListViewActivity> {
  List<UserModel> data = [
    UserModel(1, "IK", "Dr. Ikhwan Koto", "Jl Pamayahan 1"),
    UserModel(2, "PA", "Dr. Pake Arrayid", "Jl Suka 98"),
    UserModel(3, "RK", "Dr. Ryan Kimo", "Tuparev 7654"),
    UserModel(4, "AM", "Dr. Arif Mahran", "Komplek D4RT"),
    UserModel(5, "NH", "Dr. Nurrahman Hado", "Jl Srikandi 76"),
    UserModel(6, "AN", "Dr. Ade Nuri", "Kanggraksan No 190"),
    UserModel(7, "FC", "Dr. Fitriani Chairi", "Apartment Kuningan 98"),
    UserModel(8, "EA", "Dr. Elsa Aprilio", "Jl Celeng 56"),
    UserModel(9, "PC", "Dr. Putri Coti", "Jl Rakit Pundan 098"),
    UserModel(10, "SE", "Dr. Saputra Enriko", "Jl. Wadidu 87"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 6, 67, 117),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Data Dokter",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 24),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemUser(
              index,
              data[index],
              (dataModel) {
                onListClick(dataModel);
              },
            );
          },
        ),
      ),
    );
  }

  onListClick(UserModel dataUser) {
    print("Data: " + dataUser.name);
  }
}
