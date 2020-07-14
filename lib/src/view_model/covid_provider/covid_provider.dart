import 'package:covidhino/src/model/helper/covid_helper.dart';
import 'package:covidhino/src/view_model/covid_provider/world_total_struct.dart';
import 'package:covidhino/src/view_model/covid_provider/plot_struct.dart';
import 'package:covidhino/src/model/entities/country_total_entity.dart';
import 'package:flutter/material.dart';

enum Status { Loading, Error, Success }

class CovidProvider extends ChangeNotifier {
  Status _allWorldStatus;
  Status _allCountryStatus;

  WorldTotalStruct _worldTotalStruct = WorldTotalStruct(null, '');
  List<CountryTotal> _countryTotal;

  int _isWorldCases = 0;
  String _errorMessage;

  CovidHelper _covidHelper = CovidHelper();

  Future<void> getWorldTotal() async {
    _allWorldStatus = Status.Loading;
    try {
      _worldTotalStruct.worldTotal = await _covidHelper.getWorldTotal();
      _allWorldStatus = Status.Success;
    } catch (e) {
      _worldTotalStruct.errorMessage = e.toString();
      _allWorldStatus = Status.Error;
    }
    notifyListeners();
  }

  Future<void> getCountryTotal() async {
    _allCountryStatus = Status.Loading;
    try {
      _countryTotal = await _covidHelper.getCountryTotal();
      print("-------------Provider------------------" +
          _countryTotal.length.toString());
      _allCountryStatus = Status.Success;
    } catch (e) {
      print(e);
      _errorMessage = e.toString();
      _allCountryStatus = Status.Error;
    }
    notifyListeners();
  }

  List<PlotStruct> getCountryActiveStats() {
    List<PlotStruct> activeCountryStats = [];
    for (int i = 0; i < _countryTotal.length; i++) {
      activeCountryStats.add(PlotStruct(_countryTotal[i].active, i + 1));
    }
    return activeCountryStats;
  }
  List<PlotStruct> getCountryDeadStats() {
    List<PlotStruct> deadCountryStats = [];
    for (int i = 0; i < _countryTotal.length; i++) {
      deadCountryStats.add(PlotStruct(_countryTotal[i].deaths, i + 1));
    }
    return deadCountryStats;
  }

  List<PlotStruct> getCountryRecoverStats() {
    List<PlotStruct> recoveredCountryStats = [];
    for (int i = 0; i < _countryTotal.length; i++) {
      recoveredCountryStats.add(PlotStruct(_countryTotal[i].recovered, i + 1));
    }
    return recoveredCountryStats;
  }

  void togggleisWorldCases(int index) {
    _isWorldCases = index;
    notifyListeners();
  }

  WorldTotalStruct get worldTotalStruct => _worldTotalStruct;

  int get isWorldCases => _isWorldCases;

  Status get allCountryStatus => _allCountryStatus;

  Status get allWorldStatus => _allWorldStatus;

  List<CountryTotal> get countryTotal => _countryTotal;

  String get errorMessage => _errorMessage;
}
