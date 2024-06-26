// To parse this JSON data, do
//
//     final divisi = divisiFromJson(jsonString);

import 'dart:convert';

List<DivisiModel> divisiFromJson(String str) => List<DivisiModel>.from(
    json.decode(str).map((x) => DivisiModel.fromJson(x)));

String divisiToJson(List<DivisiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DivisiModel {
  DivisiModel({
    required this.id,
    required this.createdAt,
    required this.img,
    required this.nama,
    required this.ket,
  });

  int id;
  DateTime createdAt;
  String img;
  String nama;
  String ket;

  factory DivisiModel.fromJson(Map<String, dynamic> json) => DivisiModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        img: json["img"],
        nama: json["nama"],
        ket: json["ket"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "img": img,
        "nama": nama,
        "ket": ket,
      };
}
