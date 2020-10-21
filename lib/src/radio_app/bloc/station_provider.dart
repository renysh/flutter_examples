import 'package:flutter/foundation.dart';
import 'package:flutter_examples/src/radio_app/data/api_repository.dart';
import 'package:flutter_examples/src/radio_app/data/api_repository_impl.dart';
import 'package:flutter_examples/src/radio_app/models/station.model.dart';

class StationProvider with ChangeNotifier {
  ApiRepositoryInterface _api = ApiRepositoryImpl();

  List<Station> _stations = [];

  List<Station> get stations => _stations;

  void loadStations() async {
    this._stations = await this._api.getStations();
    notifyListeners();
  }

}
