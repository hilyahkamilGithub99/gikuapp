import 'package:flutter/material.dart';
import 'package:blog_app/home_page.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 6, 67, 117),
        foregroundColor: Colors.white,
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
          'Tentang Kami',
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
                children: [
                  SizedBox(height: 8),
                  Image.asset(
                    'images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    'Giku Apps',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),

            //deskripsi aplikasi
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(8),
              child: Text(
                'Giku Apps menawarkan informasi dan solusi cepat kepada pasien yang mengalami sakit gigi untuk mendapatkan nomor antrian dokter gigi secara efisien',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),

            //misi
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visi:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Upaya untuk mempermudah akses informasi dokter gigi serta menigkatkan pelayanan bagi pasien',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Misi:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text(
                        'Menyediakan layanan informasi yang lengkap kepada pengguna'),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_right),
                    title:
                        Text('Menyediakan administrasi antrian yang efisien'),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text(
                        'Selalu menjaga kepuasan pengguna terhadap fitur-fitur dan tampilan dalam aplikasi'),
                  ),
                ],
              ),
            ),

            //sejarah
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(8),
              child: Text(
                'Giku Aps Dibuat oleh mahasiswa jurusan Teknik Informatika Politeknik Negeri Indramayu pada tahun 2023 yang bertujuan untuk mempermudah pasien dan dokter gigi dalam mencari informasi maupun admintrasi.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),

            //kontak
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    'Contact Us:',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Teknik Informatika POLINDRA'),
                    subtitle: Text('Lohbener - Indramayu'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('089636505062'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('asepsj07@gmail.com'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
