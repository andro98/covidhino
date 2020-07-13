import 'package:covidhino/src/model/entities/world_total_entity.dart';
import 'package:covidhino/src/model/services/covid_service.dart';
import 'package:covidhino/src/model/entities/country_total_entity.dart';

class CovidHelper {
  final covidService = CovidService();

  Future<WorldTotal> getWorldTotal() async {
    return await covidService.getWorldTotal();
  }
  Future<List<CountryTotal>> getCountryTotal() async {
    return await covidService.getCountryTotal();
  }
}
