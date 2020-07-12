import 'package:covidhino/src/model/entities/world_total_entity.dart';

class WorldTotalStruct {
  WorldTotal _worldTotal;
  String _errorMessage;

  WorldTotalStruct(this._worldTotal, this._errorMessage);

  WorldTotal get worldTotal => _worldTotal;

  set worldTotal(WorldTotal value) {
    _worldTotal = value;
  }

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _errorMessage = value;
  }
}