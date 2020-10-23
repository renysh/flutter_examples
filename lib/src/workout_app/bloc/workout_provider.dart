import 'package:flutter/material.dart';
import 'package:flutter_examples/src/data/api_repository.dart';
import 'package:flutter_examples/src/data/api_repository_impl.dart';
import 'package:flutter_examples/src/workout_app/models/training-state.model.dart';

class WorkoutProvider with ChangeNotifier {
  ApiRepositoryInterface _api = ApiRepositoryImpl();

  TrainingState _selectedState = TrainingState();
  TrainingState get selectedState => _selectedState;

  List<TrainingState> _states = [];

  List<TrainingState> get states => _states;

  Future<void> loadStates() async {
    this._states = await this._api.getTrainingStates();
    this._selectedState = this._states[0];
    notifyListeners();
  }

  void selectState(TrainingState state) {
    this._selectedState = state;
    notifyListeners();
  }
}
