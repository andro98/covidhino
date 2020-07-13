import 'package:covidhino/src/model/helper/covid_helper.dart';
import 'package:covidhino/src/view_model/covid_provider/world_total_struct.dart';
import 'package:covidhino/src/model/entities/country_total_entity.dart';
import 'package:flutter/material.dart';

enum Status { Loading, Error, Success }

class CovidProvider extends ChangeNotifier {
  Status _allWorldStatus;
  Status _allCountryStatus;

  WorldTotalStruct _worldTotalStruct = WorldTotalStruct(null, '');
  List<CountryTotal> _countryTotal;

  bool _isWorldCases = true;
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
      _allCountryStatus = Status.Success;
    } catch (e) {
      _errorMessage = e.toString();
      _allCountryStatus = Status.Error;
    }
    notifyListeners();
  }

  void togggleisWorldCases(){
    _isWorldCases = !_isWorldCases;
    notifyListeners();
  }

  WorldTotalStruct get worldTotalStruct => _worldTotalStruct;
  bool get isWorldCases => _isWorldCases;
  Status get allCountryStatus => _allCountryStatus;
  Status get allWorldStatus => _allWorldStatus;
  List<CountryTotal> get countryTotal => _countryTotal;
  String get errorMessage => _errorMessage;
}
