import 'package:flutter_examples/src/radio_app/data/api_repository.dart';
import 'package:flutter_examples/src/radio_app/data/in_memory_stations.dart';
import 'package:flutter_examples/src/radio_app/models/station.model.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<List<Station>> getStations() async {
    await Future.delayed(const Duration(seconds: 1));
    return stations;
  }
}
