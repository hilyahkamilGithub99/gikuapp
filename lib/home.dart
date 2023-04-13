import 'package:flutter/material.dart';
import 'package:blog_app/home_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF62CDFF),
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
          ),
        ),
        title: Text(
          'WELCOME TO GIKU APPS',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //logo
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),

            //deskripsi aplikasi
          ],
        ),
      ),
    );
  }
}
