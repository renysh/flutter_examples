import 'package:flutter/foundation.dart';
import 'package:flutter_examples/src/data/api_repository.dart';
import 'package:flutter_examples/src/data/api_repository_impl.dart';
import 'package:flutter_examples/src/radio_app/models/station.model.dart';

class StationProvider with ChangeNotifier {
  ApiRepositoryInterface _api = ApiRepositoryImpl();

  double _percentValue = 0.0;

  Station _selectedStation = Station();

  List<Station> _stations = [];

  List<Station> get stations => _stations;

  double get percentValue => _percentValue;

  Station get selectedStation => _selectedStation;

  void loadStations() async {
    this._stations = await this._api.getStations();
    this._selectedStation = this._stations[0];
    notifyListeners();
  }

  void setPercent(double percent) {
    this._percentValue = percent;
    notifyListeners();
  }

  void changeStation(Station station) {
    this._selectedStation = station;
    notifyListeners();
  }

  String percentLabel() {
    return _percentValue.toStringAsFixed(0) + '%';
  }
}
