import 'package:flutter_examples/src/radio_app/models/station.model.dart';

abstract class ApiRepositoryInterface {
    Future<List<Station>> getStations();
}