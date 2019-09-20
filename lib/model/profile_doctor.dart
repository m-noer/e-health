class ProfileDoctor {
  final String nama;
  final String status;
  final String bidang;
  final String rating;
  final String totalRate;
  final String jarak;
  final String alamat;
  final String foto;

  ProfileDoctor({
    this.nama,
    this.status,
    this.bidang,
    this.rating,
    this.totalRate,
    this.jarak,
    this.alamat,
    this.foto,
  });

  factory ProfileDoctor.fromJson(Map<String, dynamic> json) {
    return ProfileDoctor(
      nama: json['nama'],
      status: json['status'],
      bidang: json['bidang'],
      rating: json['rating'],
      totalRate: json['totalRate'],
      jarak: json['jarak'],
      alamat: json['alamat'],
      foto: json['foto'],
    );
  }
}
