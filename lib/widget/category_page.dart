import 'package:flutter/material.dart';
import 'package:healthcare/widget/category_doctor.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Center(
          child: Text("Konsultasi"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CategoryDoctor(
                      icon: "assets/icon/general.png",
                      category: "Dokter Umum",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/obstetric.png",
                      category: "Spesialis Kandungan",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/children.png",
                      category: "Spesialis Anak",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CategoryDoctor(
                      icon: "assets/icon/skin.png",
                      category: "Spesialis Kulit",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/internal-medecine.png",
                      category: "Spesialis Penyakit Dalam",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/dentist.png",
                      category: "Dokter Gigi",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CategoryDoctor(
                      icon: "assets/icon/reproduction.png",
                      category: "Spesialis Reproduksi",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/surgeon.png",
                      category: "Spesialis Bedah",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/neurologist.png",
                      category: "Spesialis Saraf",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CategoryDoctor(
                      icon: "assets/icon/cardiologist.png",
                      category: "Spesialis Jantung",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/tht.png",
                      category: "Spesialis THT",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/eye.png",
                      category: "Spesialis Mata",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CategoryDoctor(
                      icon: "assets/icon/pyscho-therapist.png",
                      category: "Psiko Terapis",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/nutrition.png",
                      category: "Spesialis Gizi",
                    ),
                    CategoryDoctor(
                      icon: "assets/icon/other.png",
                      category: "Spesialis Lainnya",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
