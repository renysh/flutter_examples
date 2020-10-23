import 'package:flutter_examples/src/radio_app/models/station.model.dart';
import 'package:flutter_examples/src/workout_app/models/training-state.model.dart';

abstract class ApiRepositoryInterface {
  Future<List<Station>> getStations();
  Future<List<TrainingState>> getTrainingStates();
}
