class UserModel {
  String nama;
  String noTelpon;
  String email;
  String alamat;
  String password; // Tambahkan field password jika ingin mengupdate

  UserModel({
    required this.nama,
    required this.noTelpon,
    required this.email,
    required this.alamat,
    this.password = '', // Inisialisasi password jika kosong
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nama: json['namaPengguna'],
      noTelpon: json['noTelpon'],
      email: json['email'],
      alamat: json['alamat'],
      password: json['password'] ?? '', // Tambahkan jika ada di response
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'namaPengguna': nama,
      'noTelpon': noTelpon,
      'email': email,
      'alamat': alamat,
      'password': password, // Sertakan password jika diperlukan
    };
  }
}
