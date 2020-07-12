import 'package:covidhino/src/model/entities/world_total_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidService {
  Future<WorldTotal> getWorldTotal() async {
    final url = 'https://api.covid19api.com/world/total';
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return WorldTotal.fromJson(json.decode(res.body));
    } else {
      throw ("Failed to retrieve data");
    }
  }
}
