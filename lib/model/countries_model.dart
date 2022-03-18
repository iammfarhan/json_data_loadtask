// To parse this JSON data, do
//
//     final countries = countriesFromJson(jsonString);

import 'dart:convert';

List<Countries> countriesFromJson(String str) => List<Countries>.from(json.decode(str).map((x) => Countries.fromJson(x)));

String countriesToJson(List<Countries> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Countries {
    Countries({
        required this.name,
        required this.code,
    });

    String name;
    String code;

    factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
    };
}
