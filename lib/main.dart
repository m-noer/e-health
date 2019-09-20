import 'package:flutter/material.dart';
import 'package:healthcare/widget/card_consultation.dart';
import 'package:healthcare/widget/category_page.dart';
import 'package:healthcare/widget/chat_page.dart';
import 'package:healthcare/widget/profilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
        ),
        title: Center(
          child: Text(
            "Konsultasi",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.history,
              color: Colors.blue,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                CardConsultation(
                  icon: "assets/icon/doctor.png",
                  header: "Tanya Dokter",
                  details:
                      "Tanyakan semua keluhan kesehatan mu bersama dokter yang terpercaya dalam menyembuhkan penyakit.",
                  iconInfo: "assets/icon/info.png",
                  color1: Color(0xff00d2ff),
                  color2: Color(0xff3a7bd5),
                  route: CategoryPage(),
                ),
                CardConsultation(
                  icon: "assets/icon/chat.png",
                  header: "Dokter Bot",
                  details:
                      "Lakukan konsultasi kesehatan dan bertanya tentang kesehatan dengan menggunakan Dokter Bot secara cuma-cuma alias gratis.",
                  iconInfo: "assets/icon/info2.png",
                  color1: Color(0xff614385),
                  color2: Color(0xff516395),
                  route: Chat(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
