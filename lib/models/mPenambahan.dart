import 'dart:convert';

List<Penambahan> penambahanfromJson(String str) => List<Penambahan>.from(json.decode(str).map((x) => Penambahan.fromJson(x)));

String indonesiaHomeToJson(List<Penambahan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Penambahan {
    Penambahan({
        this.jumlahPositif,
        this.jumlahMeninggal,
        this.jumlahSembuh,
        this.jumlahDirawat,
        this.tanggal,
        this.created,
    });

    int jumlahPositif;
    int jumlahMeninggal;
    int jumlahSembuh;
    int jumlahDirawat;
    DateTime tanggal;
    DateTime created;

    factory Penambahan.fromJson(Map<String, dynamic> json) => Penambahan(
        jumlahPositif: json["jumlah_positif"],
        jumlahMeninggal: json["jumlah_meninggal"],
        jumlahSembuh: json["jumlah_sembuh"],
        jumlahDirawat: json["jumlah_dirawat"],
        tanggal: DateTime.parse(json["tanggal"]),
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "jumlah_positif": jumlahPositif,
        "jumlah_meninggal": jumlahMeninggal,
        "jumlah_sembuh": jumlahSembuh,
        "jumlah_dirawat": jumlahDirawat,
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "created": created.toIso8601String(),
    };
}
