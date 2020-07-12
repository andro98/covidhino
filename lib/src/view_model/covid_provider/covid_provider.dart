import 'package:covidhino/src/model/helper/covid_helper.dart';
import 'package:covidhino/src/view_model/covid_provider/world_total_struct.dart';
import 'package:flutter/material.dart';

enum Status { Loading, Error, Success }

class CovidProvider extends ChangeNotifier {
  Status _allWorldStatus;

  WorldTotalStruct _worldTotalStruct;

  CovidHelper _covidHelper = CovidHelper();

  Future<void> getWorldTotal() async {
    _allWorldStatus = Status.Loading;
    notifyListeners();
    try {
      _worldTotalStruct.worldTotal = await _covidHelper.getWorldTotal();
      _allWorldStatus = Status.Success;
    } catch (e) {
      _worldTotalStruct.errorMessage = e.toString();
      _allWorldStatus = Status.Error;
    }
    notifyListeners();
  }
}
