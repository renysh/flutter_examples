import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_examples/src/workout_app/workout_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
    WorkOutApp(),
  );
}
