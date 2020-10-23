import 'package:flutter_examples/src/data/api_repository.dart';
import 'package:flutter_examples/src/data/in_memory_stations.dart';
import 'package:flutter_examples/src/data/in_memory_trainig_status.dart';
import 'package:flutter_examples/src/radio_app/models/station.model.dart';
import 'package:flutter_examples/src/workout_app/models/training-state.model.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<List<Station>> getStations() async {
    await Future.delayed(const Duration(seconds: 1));
    return stations;
  }

  @override
  Future<List<TrainingState>> getTrainingStates() async {
    await Future.delayed(const Duration(seconds: 1));
    return trainingStates;
  }
}
