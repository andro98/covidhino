import 'package:meta/meta.dart';
import 'dart:convert';

List<CountryTotal> countryTotalFromJson(List<dynamic> str) =>
    List<CountryTotal>.from(str.map((x) => CountryTotal.fromJson(x)));

String countryTotalToJson(List<CountryTotal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryTotal {
  CountryTotal({
    @required this.country,
    @required this.countryCode,
    @required this.province,
    @required this.city,
    @required this.cityCode,
    @required this.lat,
    @required this.lon,
    @required this.confirmed,
    @required this.deaths,
    @required this.recovered,
    @required this.active,
    @required this.date,
  });

  final Country country;
  final String countryCode;
  final String province;
  final String city;
  final String cityCode;
  final String lat;
  final String lon;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;
  final DateTime date;

  factory CountryTotal.fromJson(Map<String, dynamic> json) => CountryTotal(
        country:
            json["Country"] == null ? null : countryValues.map[json["Country"]],
        countryCode: json["CountryCode"] == null ? null : json["CountryCode"],
        province: json["Province"] == null ? null : json["Province"],
        city: json["City"] == null ? null : json["City"],
        cityCode: json["CityCode"] == null ? null : json["CityCode"],
        lat: json["Lat"] == null ? null : json["Lat"],
        lon: json["Lon"] == null ? null : json["Lon"],
        confirmed: json["Confirmed"] == null ? null : json["Confirmed"],
        deaths: json["Deaths"] == null ? null : json["Deaths"],
        recovered: json["Recovered"] == null ? null : json["Recovered"],
        active: json["Active"] == null ? null : json["Active"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Country": country == null ? null : countryValues.reverse[country],
        "CountryCode": countryCode == null ? null : countryCode,
        "Province": province == null ? null : province,
        "City": city == null ? null : city,
        "CityCode": cityCode == null ? null : cityCode,
        "Lat": lat == null ? null : lat,
        "Lon": lon == null ? null : lon,
        "Confirmed": confirmed == null ? null : confirmed,
        "Deaths": deaths == null ? null : deaths,
        "Recovered": recovered == null ? null : recovered,
        "Active": active == null ? null : active,
        "Date": date == null ? null : date.toIso8601String(),
      };
}

enum Country { EGYPT }

final countryValues = EnumValues({"Egypt": Country.EGYPT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
