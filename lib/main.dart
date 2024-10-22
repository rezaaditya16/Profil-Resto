import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future launch(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {
    throw Exception('Tidak dapat memanggil : $uri');
  }
}

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Jago Cafe';
    biodata['email'] = 'info@Jagocafe.com';
    biodata['phone'] = '+62345678910';
    biodata['image'] = 'resto.jpg';
    biodata['addr'] = 'Jl. Pemuda No.15, Semarang';
    biodata['desc'] =
        'Restoran dengan hidangan khas tradisional Indonesia. Menyediakan berbagai jenis menu dengan bahan berkualitas dan rasa yang otentik.';
    biodata['menu'] =
        '1. Espresso \n2. Americano \n3. Caffe Latte \n4.Cappucino \n5.Tea';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Resto",
      home: Scaffold(
        appBar: AppBar(title: Text("JAGO CAFE")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Nama Restoran
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(color: const Color.fromARGB(255, 192, 185, 185)),
                child: Text(
                  biodata['name'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              // Gambar Restoran
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  btnContact(Icons.alternate_email, Colors.green[900],
                      "mailto:${biodata['email'] ?? ''}?subject=Tanya%20Seputar%20Resto"),
                  btnContact(Icons.phone, Colors.blueAccent,
                      "tel:${biodata['phone']}"),
                  btnContact(Icons.map, Colors.deepPurple,
                      "https://www.google.com/maps/search/?api=1&query=-6.982,110.409"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Deskripsi Restoran
              teksKotak(Colors.black38, 'Deskripsi'),
              SizedBox(
                height: 10,
              ),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              // List Menu
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  teksKotak(Colors.black38, 'List Menu'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    biodata['menu'] ?? '',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
               // Alamat Restoran
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  teksKotak(Colors.black38, 'Alamat'),
                  SizedBox(
                    height: 10,
                  ),
                  textAttribute('Alamat', biodata['addr'] ?? ''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tombol dengan ikon untuk email, telepon, dan peta
Expanded btnContact(IconData icon, var color, String uri) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        launch(uri);
      },
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: color,
          foregroundColor: Colors.white),
    ),
  );
}

// Menampilkan atribut dengan judul dan teks
Row textAttribute(String judul, String teks) {
  return Row(
    children: [
      Container(
        width: 80,
        child: Text(
          '- $judul ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      Text(
        ': ',
        style: TextStyle(fontSize: 18),
      ),
      Text(
        teks,
        style: TextStyle(fontSize: 18),
      ),
    ],
  );
}

// Container untuk kotak teks dengan latar belakang berwarna
Container teksKotak(Color bgColor, String teks) {
  return Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.center,
    width: double.infinity,
    decoration: BoxDecoration(color: bgColor),
    child: Text(
      teks,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}
