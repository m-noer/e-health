import 'package:flutter/material.dart';
import 'package:healthcare/widget/custom_appbar.dart';

import 'card_consultation.dart';
import 'category_page.dart';
import 'chat_page.dart';

class ConsultationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(),
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
                  route: Chat(
                    name: "dummy",
                    image: "",
                    status: "online",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
