import 'package:meta/meta.dart';

class WorldTotal {
  WorldTotal({
    @required this.totalConfirmed,
    @required this.totalDeaths,
    @required this.totalRecovered,
  });

  final int totalConfirmed;
  final int totalDeaths;
  final int totalRecovered;

  factory WorldTotal.fromJson(Map<String, dynamic> json) => WorldTotal(
    totalConfirmed: json["TotalConfirmed"] == null ? null : json["TotalConfirmed"],
    totalDeaths: json["TotalDeaths"] == null ? null : json["TotalDeaths"],
    totalRecovered: json["TotalRecovered"] == null ? null : json["TotalRecovered"],
  );

  Map<String, dynamic> toJson() => {
    "TotalConfirmed": totalConfirmed == null ? null : totalConfirmed,
    "TotalDeaths": totalDeaths == null ? null : totalDeaths,
    "TotalRecovered": totalRecovered == null ? null : totalRecovered,
  };
}
