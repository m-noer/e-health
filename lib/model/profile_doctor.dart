import 'package:flutter/foundation.dart';

class ProfileDoctor {
  String nama;
  String status;
  String bidang;
  String alamat;
  String foto;

  ProfileDoctor({this.nama, this.status, this.bidang, this.alamat, this.foto});

  ProfileDoctor.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    status = json['status'];
    bidang = json['bidang'];
    alamat = json['alamat'];
    foto = json['foto'];
  }
}
